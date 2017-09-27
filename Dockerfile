FROM alpine:latest
MAINTAINER aramsay

ARG node_version
ARG node_package=nodejs
ARG node_package_npm=nodejs-npm

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add --update ${node_package}=${node_version} ${node_package_npm}=${node_version} libexecinfo-dev@edge && rm -rf /var/cache/apk/*
