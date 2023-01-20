FROM docker.io/library/alpine:3.17.1

RUN apk add bind-tools curl iputils

ENTRYPOINT [ "sleep", "3600" ]