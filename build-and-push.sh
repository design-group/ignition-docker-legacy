#!/usr/bin/env bash

# Build out all pre-8.1.17 Versions and push them to dockerhub
for i in $(seq 13 16); do docker build -t bwdesigngroup/ignition-docker:8.1.$i -f legacy-versions/pre-8-1-17-Dockerfile --build-arg IGNITION_VERSION=8.1.$i .; docker push bwdesigngroup/ignition-docker:8.1.$i; done

# Build out all current versions and push them to dockerhub
for i in $(seq 17 21); do docker build -t bwdesigngroup/ignition-docker:8.1.$i --build-arg IGNITION_VERSION=8.1.$i .; docker push bwdesigngroup/ignition-docker:8.1.$i; done