FROM docker.io/library/alpine:3.14.2

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]