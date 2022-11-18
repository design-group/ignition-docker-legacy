ARG IGNITION_VERSION="8.1.16"
FROM inductiveautomation/ignition:${IGNITION_VERSION:-latest}

ENV WORKING_DIRECTORY ${WORKING_DIRECTORY:-/workdir}
ENV ACCEPT_IGNITION_EULA "Y"
ENV GATEWAY_ADMIN_USERNAME ${GATEWAY_ADMIN_USERNAME:-admin}
ENV GATEWAY_ADMIN_PASSWORD ${GATEWAY_ADMIN_PASSWORD:-password}
ENV IGNITION_EDITION ${IGNITION_EDITION:-standard}
ENV IGNITION_UID ${IGNITION_UID:-1000}
ENV IGNITION_GID ${IGNITION_GID:-1000}
ENV DEVELOPER_MODE  ${DEVELOPER_MODE:-N}
ENV IGNITION_INSTALL_USERHOME /home/ignition

ENV SYMLINK_LOGBACK ${SYMLINK_LOGBACK:-true}
ENV SYMLINK_PROJECTS ${SYMLINK_PROJECTS:-true}
ENV SYMLINK_THEMES ${SYMLINK_THEMES:-true}
ENV ADDITIONAL_DATA_FOLDERS ${ADDITIONAL_DATA_FOLDERS:-}

# Setup dedicated user and  map file permissions
RUN mkdir ${IGNITION_INSTALL_USERHOME} && \
    (getent group ${IGNITION_GID} > /dev/null 2>&1 || groupadd -r ignition -g ${IGNITION_GID}) && \
    (getent passwd ${IGNITION_UID} > /dev/null 2>&1 || useradd -r -d ${IGNITION_INSTALL_USERHOME} -u ${IGNITION_UID} -g ${IGNITION_GID} ignition) && \
    chown ${IGNITION_UID}:${IGNITION_GID} ${IGNITION_INSTALL_USERHOME}

# Create a new folder to include your symlink contents in
RUN mkdir -p ${WORKING_DIRECTORY} && \
    chown -R  ${IGNITION_UID}:${IGNITION_GID} ${WORKING_DIRECTORY} && \
    chown -R ${IGNITION_UID}:${IGNITION_GID} /usr/local/bin/

# Check if any of the symlinks are enabled, if so, create the working directory
RUN if [ "$SYMLINK_LOGBACK" = "true" ] || [ "$SYMLINK_PROJECTS" = "true" ] || [ "$SYMLINK_THEMES" = "true" ]; then \
    mkdir -p ${WORKING_DIRECTORY} && \
    chown -R  ${IGNITION_UID}:${IGNITION_GID} ${WORKING_DIRECTORY}; \
    fi

# Copy gitignore into the working
COPY --chown=${IGNITION_UID}:${IGNITION_GID} ../../seed-contents/ /usr/local/bin/seed-contents/
COPY --chmod=0755 --chown=${IGNITION_UID}:${IGNITION_GID} ../../entrypoint-shim.sh /usr/local/bin/

USER ${IGNITION_UID}:${IGNITION_GID}

ENTRYPOINT [ "entrypoint-shim.sh" ]