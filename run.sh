#!/bin/sh

set -eu

./gradlew "${SETUP_TASK:-setupDecompWorkspace}"
./gradlew build
