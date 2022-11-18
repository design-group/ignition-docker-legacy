ARG IGNITION_VERSION="8.1.20"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.13/MQTT-Distributor-signed.modl"
ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_SHA256="11109fc5a60415352dde920348d2e4278c23d2c2e7a7bea4c0823246d96aa9d0"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.13/MQTT-Engine-signed.modl"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_SHA256="b40f36ed2d28bed3f98356c00398b753855c51a5dc1e5dc576c891a36a8edb03"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.13/MQTT-Transmission-signed.modl"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_SHA256="2b4fd6c896781273fef0b00dfe51d5e1f0a82e1b2b0e3530e36a20f2ebd7b184"

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