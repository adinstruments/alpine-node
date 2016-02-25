FROM alpine
MAINTAINER aramsay

# we use non-root user in the container for security.
# dr expects uid 22022 and gid 22022.
RUN apk add --update bash curl wget gnupg nodejs python && rm -rf /var/cache/apk/*
RUN addgroup -S -g 22022 drgroup
RUN adduser -S -u 22022 -G drgroup -g '' -h /home/druser druser

# create /dr and allow druser write access.
RUN mkdir /drunner && chown druser:drgroup /drunner
