# CONTAINER_RUNTIME
# The CONTAINER_RUNTIME variable will be used to specified the path to a
# container runtime. This is needed to start and run a container image.
CONTAINER_RUNTIME?=$(shell which podman)

# NETWORKTOOLS_IMAGE_REGISTRY_NAME
# Defines the name of the new container to be built using several variables.
NETWORKTOOLS_IMAGE_REGISTRY_NAME?=git.cryptic.systems
NETWORKTOOLS_IMAGE_REGISTRY_USER?=volker.raschek

NETWORKTOOLS_IMAGE_NAMESPACE?=${NETWORKTOOLS_IMAGE_REGISTRY_USER}
NETWORKTOOLS_IMAGE_NAME:=network-tools
NETWORKTOOLS_IMAGE_VERSION?=latest
NETWORKTOOLS_IMAGE_FULLY_QUALIFIED=${NETWORKTOOLS_IMAGE_REGISTRY_NAME}/${NETWORKTOOLS_IMAGE_NAMESPACE}/${NETWORKTOOLS_IMAGE_NAME}:${NETWORKTOOLS_IMAGE_VERSION}
NETWORKTOOLS_IMAGE_UNQUALIFIED=${NETWORKTOOLS_IMAGE_NAMESPACE}/${NETWORKTOOLS_IMAGE_NAME}:${NETWORKTOOLS_IMAGE_VERSION}

# BUILD CONTAINER IMAGE
# ==============================================================================
PHONY:=container-image/build
container-image/build:
	${CONTAINER_RUNTIME} build \
		--file Dockerfile \
		--no-cache \
		--pull \
		--tag ${NETWORKTOOLS_IMAGE_FULLY_QUALIFIED} \
		--tag ${NETWORKTOOLS_IMAGE_UNQUALIFIED} \
		.

# DELETE CONTAINER IMAGE
# ==============================================================================
PHONY:=container-image/delete
container-image/delete:
	- ${CONTAINER_RUNTIME} image rm ${NETWORKTOOLS_IMAGE_FULLY_QUALIFIED} ${NETWORKTOOLS_IMAGE_UNQUALIFIED}
	- ${CONTAINER_RUNTIME} image rm ${BASE_IMAGE_FULL}

# PUSH CONTAINER IMAGE
# ==============================================================================
PHONY+=container-image/push
container-image/push:
	echo ${NETWORKTOOLS_IMAGE_REGISTRY_PASSWORD} | ${CONTAINER_RUNTIME} login ${NETWORKTOOLS_IMAGE_REGISTRY_NAME} --username ${NETWORKTOOLS_IMAGE_REGISTRY_USER} --password-stdin
	${CONTAINER_RUNTIME} push ${NETWORKTOOLS_IMAGE_FULLY_QUALIFIED}

# PHONY
# ==============================================================================
# Declare the contents of the PHONY variable as phony.  We keep that information
# in a variable so we can use it in if_changed.
.PHONY: ${PHONY}