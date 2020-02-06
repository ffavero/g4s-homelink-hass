#!/bin/bash
set -ev

if [ ! -z ${TRAVIS_TAG} ]; then
    echo "Tagged build found. Pushing to Docker with tag 'latest'."
    echo "${TRAVIS_TAG}"
else
    echo "No tag found. Pushing to Docker with tag 'test'."
fi

git status

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

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
