FROM docker.io/library/alpine:3.21.1

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]