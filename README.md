# network-tools

[![Build Status](https://drone.cryptic.systems/api/badges/volker.raschek/network-tools/status.svg)](https://drone.cryptic.systems/volker.raschek/network-tools)
[![Docker Pulls](https://img.shields.io/docker/pulls/volkerraschek/network-tools)](https://hub.docker.com/r/volkerraschek/network-tools)

This project, hosted on
[git.cryptic.systems](https://git.cryptic.systems/volker.raschek/network-tools),
contains only files to build the container image. The container image contains
network tools to analyse or monitor network communication. This can be helpful
in a containerized environment.

## Usage

### Docker

To use this image execute the following command in a docker environment.

```bash
$ docker run \
    --rm \
    volkerraschek/network-tools:latest \
      bash
```

### Kubernetes

For a kubernetes environment you can use the [YAML-File](network-tools.yaml) by
executing the following command.

```bash
kubectl create -f https://git.cryptic.systems/volker.raschek/network-tools/network-tools.yml
```

Execute a shell inside the container by

```bash
kubectl exec -it network-tools -- sh
```
