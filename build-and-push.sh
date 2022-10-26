#!/usr/bin/env bash

# Build out the IIOT Version and push it to dockerhub
docker build -t bwdesigngroup/ignition-docker-iiot:8.1.21 -f secondary-versions/iiot --build-arg IGNITION_VERSION=8.1.21 secondary-versions/iiot; docker push bwdesigngroup/ignition-docker-mes:8.1.21

# Build out the MES Version and push them to dockerhub
docker build -t bwdesigngroup/ignition-docker-mes:8.1.20 -f secondary-versions/mes --build-arg IGNITION_VERSION=8.1.20 secondary-versions/mes; docker push bwdesigngroup/ignition-docker-mes:8.1.20

# Build out all pre-8.1.17 Versions and push them to dockerhub
for i in $(seq 13 16); do docker build -t bwdesigngroup/ignition-docker:8.1.$i -f secondary-versions/pre-8-1-17 --build-arg IGNITION_VERSION=8.1.$i .; docker push bwdesigngroup/ignition-docker:8.1.$i; done

# Build out all current versions and push them to dockerhub
for i in $(seq 17 21); do docker build -t bwdesigngroup/ignition-docker:8.1.$i --build-arg IGNITION_VERSION=8.1.$i .; docker push bwdesigngroup/ignition-docker:8.1.$i; done