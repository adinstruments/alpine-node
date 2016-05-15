FROM alpine
MAINTAINER aramsay

ENV VERSION=v4.4.4
# we use non-root user in the container for security.
# dr expects uid 22022 and gid 22022.
RUN addgroup -S -g 22022 drgroup
RUN adduser -S -u 22022 -G drgroup -g '' -h /home/druser druser

RUN apk add --update bash curl wget gnupg nodejs python \
    make gcc g++ linux-headers binutils-gold libgcc libstdc++ && \ 
    curl -o node-${VERSION}.tar.gz -sSL https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz && \
    tar -zxf node-${VERSION}.tar.gz && \
    cd node-${VERSION} && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf /node-${VERSION}.tar.gz /node-${VERSION} /usr/share/man /tmp/* /var/cache/apk/* && \
    apk del curl make gcc g++ linux-headers binutils-gold

# create /dr and allow druser write access.
RUN mkdir /drunner && chown druser:drgroup /drunner
