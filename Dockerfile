FROM docker.io/library/alpine:3.21.3

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]