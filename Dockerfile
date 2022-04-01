FROM docker.io/library/alpine:3.15.3

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]