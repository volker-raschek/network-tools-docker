# network-tools

[![Build Status](https://drone.cryptic.systems/api/badges/volker.raschek/network-tools/status.svg)](https://drone.cryptic.systems/volker.raschek/network-tools)
[![Docker Pulls](https://img.shields.io/docker/pulls/volkerraschek/network-tools)](https://hub.docker.com/r/volkerraschek/network-tools)

This project contains all sources to build the container image
`docker.io/volkerraschek/network-tools`. The primary goal of the image is only
to contain some network tools to debug container based environments like docker
or kubernetes.

## Usage

### Docker

To use this image execute the following command in a docker environment.

```bash
docker run \
  --entrypoint /bin/sh \
  -it \
  --rm \
    docker.io/volkerraschek/network-tools:latest
```

### Kubernetes

For a kubernetes environment you can use the [YAML-File](network-tools.yaml) by
executing the following command.

```bash
kubectl create -f https://git.cryptic.systems/volker.raschek/network-tools/raw/branch/master/network-tools.yml
```

Execute a shell inside the container by

```bash
kubectl exec -it network-tools -- sh
```
