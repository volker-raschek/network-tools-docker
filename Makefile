# CONTAINER_RUNTIME
CONTAINER_RUNTIME:=$(shell which docker)

# BASE_IMAGE
# Definition of the base container image for flucky
BASE_IMAGE_REGISTRY:=docker.io
BASE_IMAGE_NAMESPACE:=library
BASE_IMAGE_NAME:=alpine
BASE_IMAGE_VERSION:=3.11.2
BASE_IMAGE_FULL=${BASE_IMAGE_REGISTRY}/${BASE_IMAGE_NAMESPACE}/${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION}
BASE_IMAGE_SHORT=${BASE_IMAGE_NAMESPACE}/${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION}

CONTAINER_IMAGE_REGISTRY:=docker.io
CONTAINER_IMAGE_REGISTRY_USER:=volkerraschek
CONTAINER_IMAGE_NAMESPACE:=volkerraschek
CONTAINER_IMAGE_NAME:=network-tools
CONTAINER_IMAGE_VERSION?=latest
CONTAINER_IMAGE_SHORT:=${CONTAINER_IMAGE_NAMESPACE}/${CONTAINER_IMAGE_NAME}:${CONTAINER_IMAGE_VERSION}
CONTAINER_IMAGE_FULL:=${CONTAINER_IMAGE_REGISTRY}/${CONTAINER_IMAGE_NAMESPACE}/${CONTAINER_IMAGE_NAME}:${CONTAINER_IMAGE_VERSION}

# DEBIAN BASED CONTAINER IMAGE
# ==============================================================================
PHONY+=container-image/build
container-image/build:
	${CONTAINER_RUNTIME} build \
		--build-arg BASE_IMAGE=${BASE_IMAGE_FULL} \
		--no-cache \
		--tag ${CONTAINER_IMAGE_FULL} \
		--tag ${CONTAINER_IMAGE_SHORT} \
		.

PHONY+=container-image/push
container-image/push: container-image/build
	${CONTAINER_RUNTIME} login ${CONTAINER_IMAGE_REGISTRY} \
		--username ${CONTAINER_IMAGE_REGISTRY_USER} \
		--password ${CONTAINER_IMAGE_REGISTRY_PASSWORD}
	${CONTAINER_RUNTIME} push ${CONTAINER_IMAGE_FULL}

# PHONY
# ==============================================================================
# Declare the contents of the PHONY variable as phony.  We keep that information
# in a variable so we can use it in if_changed.
.PHONY: ${PHONY}