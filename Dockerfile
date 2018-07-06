FROM node:8.11.3-alpine

LABEL com.adinstruments.base="node-alpine"
LABEL com.adinstruments.node.version="8.11.3"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
