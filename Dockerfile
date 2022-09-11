FROM docker.io/library/alpine:3.16.2

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]