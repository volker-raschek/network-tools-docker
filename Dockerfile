FROM docker.io/library/alpine:3.16.0

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]