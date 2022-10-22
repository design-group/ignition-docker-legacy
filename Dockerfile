ARG IGNITION_VERSION="8.1.20"
FROM inductiveautomation/ignition:${IGNITION_VERSION:-latest}


ENV ACCEPT_IGNITION_EULA "Y"
ENV GATEWAY_ADMIN_USERNAME ${GATEWAY_ADMIN_USERNAME:-admin}
ENV GATEWAY_ADMIN_PASSWORD ${GATEWAY_ADMIN_PASSWORD:-password}
ENV IGNITION_EDITION ${IGNITION_EDITION:-standard}
ENV GATEWAY_MODULES_ENABLED ${GATEWAY_MODULES_ENABLED:-alarm-notification,allen-bradley-drivers,bacnet-driver,opc-ua,perspective,reporting,tag-historian,web-developer}
ENV IGNITION_UID ${IGNITION_UID:-1000}
ENV IGNITION_GID ${IGNITION_GID:-1000}

ENV SYMLINK_LOGBACK ${SYMLINK_LOGBACK:-true}
ENV SYMLINK_PROJECTS ${SYMLINK_PROJECTS:-true}
ENV SYMLINK_THEMES ${SYMLINK_THEMES:-true}
ENV ADDITIONAL_DATA_FOLDERS ${ADDITIONAL_DATA_FOLDERS:-}

# Setup dedicated user
RUN groupmod -g ${IGNITION_GID} ignition && \
    usermod -u ${IGNITION_UID} ignition && \
    chown -R ${IGNITION_UID}:${IGNITION_GID} /usr/local/bin/

ENV WORKING_DIRECTORY ${WORKING_DIRECTORY:-/workdir}
# Check if any of the symlinks are enabled, if so, create the working directory
RUN if [ "$SYMLINK_LOGBACK" = "true" ] || [ "$SYMLINK_PROJECTS" = "true" ] || [ "$SYMLINK_THEMES" = "true" ]; then \
    mkdir -p ${WORKING_DIRECTORY} && \
    chown -R  ${IGNITION_UID}:${IGNITION_GID} ${WORKING_DIRECTORY}; \
    fi
    
# Copy gitignore into the working
COPY --chown=${IGNITION_UID}:${IGNITION_GID} seed-contents/ /usr/local/bin/seed-contents/
COPY --chmod=0755 --chown=${IGNITION_UID}:${IGNITION_GID} entrypoint-shim.sh /usr/local/bin/

# Set the default user and group for the image
USER ${IGNITION_UID}:${IGNITION_GID}

ENTRYPOINT [ "entrypoint-shim.sh" ]