#!/bin/bash

DOCKER0_IP=$(ip addr show docker0 | sed -n 's/\s\+inet\ \([0-9\.]\+\)\/.*/\1/;T;p')

docker build -t dns .

docker run --detach=true --restart=always --name=dns --publish=$DOCKER0_IP:53:53/udp --volume=/run/docker.sock:/docker.sock dns --domain=lh
