#!/bin/bash
set -ev
if [ -z ${TRAVIS_TAG} ]; then
    echo "Untagged build found."
else
    echo "New git tagged build found."
fi

docker run -it --privileged --rm --name "g4s-homelink-hass" \
    -v ~/.docker:/root/.docker \
    -v "$(pwd)":/docker \
    hassioaddons/build-env:latest \
    --git \
    --$ARCH \
    --from "homeassistant/{arch}-base" \
    --author "Francesco Favero <favero.francesco@gmail.com>" \
    --doc-url "https://github.com/ffavero/g4s-homelink-hass" \
    -d "G4S homelink"

