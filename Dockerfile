FROM docker.io/library/alpine:3.18.2

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]