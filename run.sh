#!/bin/sh

set -eu

INIT_SCRIPT=
if [ -f useLocal.gradle ]; then
    INIT_SCRIPT=--init-script=useLocal.gradle
    
fi

./gradlew $INIT_SCRIPT
./gradlew $INIT_SCRIPT "${SETUP_TASK:-setupDecompWorkspace}"
./gradlew $INIT_SCRIPT build
