#!/bin/bash

echo 'Pull alpine image.'
docker pull chusiang/ansible-jupyter:alpine-3.4
echo

echo 'Tag alpine image to latest.'
docker tag  chusiang/ansible-jupyter:alpine-3.4 chusiang/ansible-jupyter:latest
echo

echo 'Push the latest tag.'
docker push chusiang/ansible-jupyter:latest
echo

echo 'Remove old image.'
docker rmi $(docker images | grep 'chusiang/ansible-jupyter' | grep '<none>' | awk '{ print $3 }')
