FROM alpine:latest
MAINTAINER aramsay

# we use non-root user in the container for security.
# we use UID 22122 here to give some separation from other dServices that use the default (22022)
RUN addgroup -S -g 22122 drgroup
RUN adduser -S -u 22122 -G drgroup -g '' -h /home/druser druser

ARG node_version
ARG node_package=nodejs

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

RUN apk add --update bash curl wget gnupg ${node_package}=${node_version} python && rm -rf /var/cache/apk/*

# create /dr and allow druser write access.
RUN mkdir /drunner && chown druser:drgroup /drunner
