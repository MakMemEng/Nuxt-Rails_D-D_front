FROM node:16.13.0-alpine

ARG WORKDIR
# ARG CONTAINER_PORT

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    # コンテナのNuxt.jsをブラウザから参照するためにip:0.0.0.0に紐付ける
    HOST=0.0.0.0

WORKDIR ${HOME}

# http://localhost(0.0.0.0):3000
# EXPOSE ${CONTAINER_PORT}