ARG IGNITION_VERSION="8.1.20"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.15/MQTT-Distributor-signed.modl"
ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_SHA256="5c81be13a9f749899825a99a109502c1eb28be940d060301a1ddf9967d488f9e"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.15/MQTT-Engine-signed.modl"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_SHA256="5693c22b391e6da31351f2bb9245ad65e96dff9d02c0a322cb70eb11a2fb86b6"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.15/MQTT-Transmission-signed.modl"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_SHA256="1e1e7428cba02dce6e579e6c82e4b8ad30d892438a7504aa0481eff7a5f87952"

RUN mkdir -p /modules/pre-loaded-modules && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/MQTT-Distributor.modl" "${MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_URL}" && \
	echo "${MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/MQTT-Distributor.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/MQTT-Engine.modl" "${MQTT_ENGINE_MODULE_DOWNLOAD_URL}" && \
	echo "${MQTT_ENGINE_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/MQTT-Engine.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/MQTT-Transmission.modl" "${MQTT_TRANSMISSION_MODULE_DOWNLOAD_URL}" && \
	echo "${MQTT_TRANSMISSION_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/MQTT-Transmission.modl" | sha256sum -c - && \
	chown -R ${IGNITION_UID}:${IGNITION_GID} /modules

COPY --chmod=0755 --chown=${IGNITION_UID}:${IGNITION_GID} secondary-versions/iiot/iiot-entrypoint-shim.sh /usr/local/bin/

# Switch back to the ignition user
USER ${IGNITION_UID}:${IGNITION_GID}

ENTRYPOINT [ "iiot-entrypoint-shim.sh" ]