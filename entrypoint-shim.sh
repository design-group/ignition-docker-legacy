#!/usr/bin/env bash

# Create the parent folders necessary for the symlinks
mkdir -p ${WORKING_DIRECTORY}/modules
mkdir -p ${IGNITION_INSTALL_LOCATION}/data/modules

# Setup the symlink for the projects folder and the theming folder
ln -s ${WORKING_DIRECTORY}/projects /usr/local/bin/ignition/data/projects
ln -s ${WORKING_DIRECTORY}/modules/com.inductiveautomation.perspective /usr/local/bin/ignition/data/modules/com.inductiveautomation.perspective

mkdir -p /workdir/projects
mkdir -p /workdir/modules/com.inductiveautomation.perspective

exec docker-entrypoint.sh "$@"