FROM node:12.16.0-alpine

LABEL com.adinstruments.base="node-alpine"
LABEL com.adinstruments.node.version="12.16.0"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
