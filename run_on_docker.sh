#!/bin/sh

IMAGE_NAME="anatawa12/forgegradle-example-runner:$(git rev-parse --short HEAD)"
CONTINER_NAME="anatawa12-forgegradle-example-runner-$(date "+%Y%m%d%H%M%S")"

docker build -t "$IMAGE_NAME" .
docker run --name "$CONTINER_NAME" "$IMAGE_NAME"
docker rmi "$IMAGE_NAME"
