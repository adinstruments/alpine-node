FROM alpine:latest
MAINTAINER aramsay

ARG node_version
ARG node_package=nodejs

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add --update ${node_package}=${node_version} && rm -rf /var/cache/apk/*
