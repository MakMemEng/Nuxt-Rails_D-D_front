<template>
  <v-app-bar
    app
    :dark="!isScrollPoint"
    :height="HomeAppBarHeight"
    :color="toolbarStyle.color"
    :elevation="toolbarStyle.elevation"
  >
    <app-logo
      @click.native="$vuetify.goTo('#scroll-top')"
    />
    <v-toolbar-title>
      {{ appName }}
    </v-toolbar-title>

    <v-spacer />

    <v-toolbar-items
      class="ml-2"
    >
      <v-btn
        v-for="(menu, i) in menus"
        :key="`menu-btn-${i}`"
        text
        @click="$vuetify.goTo(`#${menu.title}`)"
      >
        {{ $t(`menus.${menu.title}`) }}
      </v-btn>
    </v-toolbar-items>
  </v-app-bar>
</template>

<script>
export default {
  props: {
    menus: {
      type: Array,
      default: () => []
    },
    imgHeight: {
      type: Number,
      default: 0
    }
  },
  // data (context: { $config: { appName: "BizPlanner" } })
  data ({ $config: { appName }, $store }) {
    return {
      appName,
      scrollY: 0,
      HomeAppBarHeight: $store.state.styles.HomeAppBarHeight
    }
  },
  computed: {
    isScrollPoint () {
      // 500 -56 = 446px超の場合、trueを返す
      return this.scrollY > (this.imgHeight - this.HomeAppBarHeight)
    },
    toolbarStyle () {
      const color = this.isScrollPoint ? 'white' : 'transparent'
      const elevation = this.isScrollPoint ? 4 : 0
      return { color, elevation }
    }
  },
  // Vue.new() => Vueインスタンス
  // マウントされた後 => Vueの実行準備が完全に整った後
  mounted () {
    window.addEventListener('scroll', this.onScroll)
  },
  // Vueインスタンスが破壊される前に実行
  beforeDestroy () {
    window.removeEventListener('scroll', this.onScroll)
  },
  methods: {
    onScroll () {
      this.scrollY = window.scrollY
    }
  }
}
</script>
