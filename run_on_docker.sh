#!/bin/sh

IMAGE_NAME="anatawa12/forgegradle-example-runner:$(git rev-parse --short HEAD)"
CONTINER_NAME="anatawa12-forgegradle-example-runner-$(date "+%Y%m%d%H%M%S")"

if [ "$2" = "--local" ]; then
  DOCKERFILE="use-local-gradle/Dockerfile"
else
  DOCKERFILE="Dockerfile"
fi

TEMP_FILE="$(mktemp)"

tar -czhf "$TEMP_FILE" . \
    --exclude ForgeGradle/build \
    --exclude ForgeGradle/out

docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" --build-arg SETUP_TASK="$1" - < "$TEMP_FILE"

rm "$TEMP_FILE";

docker run --rm --name "$CONTINER_NAME" "$IMAGE_NAME"
docker rmi "$IMAGE_NAME"
