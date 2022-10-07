ARG IGNITION_VERSION="8.1.20"
FROM inductiveautomation/ignition:${IGNITION_VERSION:-latest}

ENV WORKING_DIRECTORY ${WORKING_DIRECTORY:-/workdir}
ENV ACCEPT_IGNITION_EULA "Y"
ENV GATEWAY_ADMIN_USERNAME ${GATEWAY_ADMIN_USERNAME:-admin}
ENV GATEWAY_ADMIN_PASSWORD ${GATEWAY_ADMIN_PASSWORD:-password}
ENV IGNITION_EDITION ${IGNITION_EDITION:-standard}
ENV GATEWAY_MODULES_ENABLED ${GATEWAY_MODULES_ENABLED:-alarm-notification,allen-bradley-drivers,bacnet-driver,opc-ua,perspective,reporting,tag-historian,web-developer}
ENV IGNITION_UID ${IGNITION_UID:-1000}
ENV IGNITION_GID ${IGNITION_GID:-1000}

# Create a new folder to include your symlink contents in
RUN mkdir -p ${WORKING_DIRECTORY} && \
    groupmod -g ${IGNITION_GID} ignition && \
    usermod -u ${IGNITION_UID} ignition && \
    chown -R  ${IGNITION_UID}:${IGNITION_GID} ${WORKING_DIRECTORY} && \
    chown -R ${IGNITION_UID}:${IGNITION_GID} /usr/local/bin/

# Copy gitignore into the working
COPY seed-contents/template.gitignore ${WORKING_DIRECTORY}/.gitignore
COPY --chmod=0755 seed-contents/entrypoint-shim.sh /usr/local/bin/

USER ${IGNITION_UID}:${IGNITION_GID}

ENTRYPOINT [ "entrypoint-shim.sh" ]