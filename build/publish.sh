#!/bin/bash
set -ev

if [ ! -z ${TRAVIS_TAG} ]; then
    echo "Tagged build found. Pushing to Docker with tag 'latest'."
    echo "${TRAVIS_TAG}"
else
    echo "No tag found. Pushing to Docker with tag 'test'."
fi

git status

sudo chown -R "$USER":"$GROUPS" ~/.docker
sudo chmod -R g+rwx ~/.docker

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker run -it --privileged --rm --name "g4s-homelink-hass" \
    hassioaddons/build-env:latest \
    --git \
    --$ARCH \
    --from "homeassistant/{arch}-base" \
    --author "Francesco Favero <favero.francesco@gmail.com>" \
    --repository "https://github.com/ffavero/g4s-homelink-hass" \
    -d "G4S homelink" --push \
    --login $DOCKER_USERNAME --password $DOCKER_PASSWORD
#    -v ~/.docker:/root/.docker \
#    -v "$(pwd)":/docker \
