FROM alpine
MAINTAINER aramsay

# we use non-root user in the container for security.
# we use UID 22122 here to give some separation from other dServices that use the default (22022)
RUN addgroup -S -g 22122 drgroup
RUN adduser -S -u 22122 -G drgroup -g '' -h /home/druser druser

RUN apk add --update bash curl wget gnupg nodejs-lts python && rm -rf /var/cache/apk/*

# create /dr and allow druser write access.
RUN mkdir /drunner && chown druser:drgroup /drunner
