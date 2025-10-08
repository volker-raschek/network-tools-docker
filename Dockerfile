FROM docker.io/library/alpine:3.22.2

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]