FROM drunner/baseimage-alpine

RUN apk update && apk add nodejs && rm -rf /var/cache/apk/*
