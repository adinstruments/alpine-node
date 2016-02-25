FROM drunner/baseimage-alpine

RUN apk update && apk add nodejs python && rm -rf /var/cache/apk/*
