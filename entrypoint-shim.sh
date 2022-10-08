#!/usr/bin/env bash

# Move the gitignore file into the working directory so the host can see it
cp -a ../seed-contents/. ${WORKING_DIRECTORY}/

# Create the parent folders necessary for the symlinks
mkdir -p ${WORKING_DIRECTORY}/modules
mkdir -p ${IGNITION_INSTALL_LOCATION}/data/modules

# Setup the symlink for the projects folder and the theming folder
ln -s ${WORKING_DIRECTORY}/projects /usr/local/bin/ignition/data/projects
ln -s ${WORKING_DIRECTORY}/modules/com.inductiveautomation.perspective /usr/local/bin/ignition/data/modules/com.inductiveautomation.perspective
ln -s ${WORKING_DIRECTORY}/ignition.conf /usr/local/bin/ignition/ignition.conf
ln -s ${WORKING_DIRECTORY}/logback.xml /usr/local/bin/ignition/logback.xml

mkdir -p /workdir/projects
mkdir -p /workdir/modules/com.inductiveautomation.perspective

# Check if docker-entrpoint is not in bin directory
if [ ! -e /usr/local/bin/docker-entrypoint.sh ]; then
    # Run the original entrypoint script
   mv docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
fi

exec docker-entrypoint.sh "$@"