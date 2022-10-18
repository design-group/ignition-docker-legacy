#!/usr/bin/env bash

entrypoint() {
    # Check if docker-entrpoint is not in bin directory
    if [ ! -e /usr/local/bin/docker-entrypoint.sh ]; then
        # Run the original entrypoint script
    mv docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
    fi

    exec docker-entrypoint.sh "$@"
}


if [ "$SYMLINK_CONF" = "true" ] || [ "$SYMLINK_LOGBACK" = "true" ] || [ "$SYMLINK_PROJECTS" = "true" ] || [ "$SYMLINK_THEMES" = "true" ]; then \
    SYMLINKS_ENABLED=true;
else 
    SYMLINKS_ENABLED=false;
fi


# If symlinks arent enabled, jump to the entrypoint
if [ "$SYMLINKS_ENABLED" = "false" ]; then \
    entrypoint;
    exit 0;
fi


# Move the gitignore file into the working directory so the host can see it
mv ../seed-contents/.gitignore ${WORKING_DIRECTORY}/

# Create the data folder for Ignition for any upcoming symlinks
mkdir -p ${IGNITION_INSTALL_LOCATION}/data

# Create the symlink for the conf folder if enabled
if [ "$SYMLINK_CONF" = "true" ]; then \
    mv ../seed-contents/ignition.conf ${WORKING_DIRECTORY}/ignition.conf

    # If the conf folder exists, remove it
    if [ -e ${IGNITION_INSTALL_LOCATION}/data/conf ]; then
        rm -rf ${IGNITION_INSTALL_LOCATION}/data/conf
    fi

    ln -s ${WORKING_DIRECTORY}/ignition.conf /usr/local/bin/ignition/ignition.conf

    # Set the wrapper.java.additional.2=-Dignition.projects.scanFrequency = to PROJECT_SCAN_FREQUENCY in ignition.conf
    sed -i "s|wrapper.java.additional.2=-Dignition.projects.scanFrequency=.*|wrapper.java.additional.2=-Dignition.projects.scanFrequency=${PROJECT_SCAN_FREQUENCY}|g" ${WORKING_DIRECTORY}/ignition.conf
fi

# Create the symlink for the logback.xml file if enabled
if [ "$SYMLINK_LOGBACK" = "true" ]; then \
    mv ../seed-contents/logback.xml ${WORKING_DIRECTORY}/logback.xml

    # If the logback.xml file exists, remove it
    if [ -e ${IGNITION_INSTALL_LOCATION}/data/logback.xml ]; then
        rm -rf ${IGNITION_INSTALL_LOCATION}/data/logback.xml
    fi

    ln -s ${WORKING_DIRECTORY}/logback.xml /usr/local/bin/ignition/logback.xml
fi

# Create the symlink for the projects folder if enabled
if [ "$SYMLINK_PROJECTS" = "true" ]; then \
    ln -s ${WORKING_DIRECTORY}/projects /usr/local/bin/ignition/data/projects
    mkdir -p /workdir/projects
fi

# Create the symlink for the themes folder if enabled
if [ "$SYMLINK_THEMES" = "true" ]; then \
    mkdir -p ${WORKING_DIRECTORY}/modules
    mkdir -p ${IGNITION_INSTALL_LOCATION}/data/modules
        ln -s ${WORKING_DIRECTORY}/modules/com.inductiveautomation.perspective /usr/local/bin/ignition/data/modules/com.inductiveautomation.perspective
        mkdir -p /workdir/modules/com.inductiveautomation.perspective
fi

# Run the entrypoint
entrypoint;