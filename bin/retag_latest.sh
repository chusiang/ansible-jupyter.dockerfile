#!/bin/bash

DOCKER_IMAGE="chusiang/ansible-jupyter"
DOCKER_TAG="alpine-3.6"

echo 'Pull alpine image.'
docker pull $DOCKER_IMAGE:$DOCKER_TAG
echo

echo 'Tag alpine image to latest.'
docker tag $DOCKER_IMAGE:$DOCKER_TAG $DOCKER_IMAGE:latest
echo

echo 'Push the latest tag.'
docker push $DOCKER_IMAGE:latest
echo

echo 'Remove old image.'
docker rmi $(docker images | grep 'chusiang/ansible-jupyter' | grep '<none>' | awk '{ print $3 }')
