#!/bin/sh

set -eu

./gradlew
./gradlew "${SETUP_TASK:-setupDecompWorkspace}"
./gradlew build
