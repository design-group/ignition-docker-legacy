ARG IGNITION_VERSION="8.1.31"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.18/MQTT-Distributor-signed.modl"
ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_SHA256="62b9015f1969a1b681d21c5f50df6acd2db89c90db9c1c7e34e152bec1a6869a"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.18/MQTT-Engine-signed.modl"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_SHA256="82eb547e389785c53162842c26edc957237d3723814aea065065be2493a93315"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.18/MQTT-Transmission-signed.modl"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_SHA256="6b4db1cc3bba0263c28ac33ba7addd3ee2ff25f01aa6b937cbd9dc09ba7f39fa"

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