FROM node:10.14.1-alpine

LABEL com.adinstruments.base="node-alpine"
LABEL com.adinstruments.node.version="10.14.1"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
