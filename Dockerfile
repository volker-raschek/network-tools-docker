FROM docker.io/library/alpine:3.22.0

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]