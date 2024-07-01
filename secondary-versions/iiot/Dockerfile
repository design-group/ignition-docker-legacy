ARG IGNITION_VERSION="8.1.42"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.22/MQTT-Distributor-signed.modl"
ARG MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_SHA256="4485d06f1a44745de80dd9facb63d2286784f643192ca25b19a3a77eb61e71e8"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.22/MQTT-Engine-signed.modl"
ARG MQTT_ENGINE_MODULE_DOWNLOAD_SHA256="affc55e4e3b011eb44cdf63f864307f03b6fb28a7c8c53e886394d517caa21e5"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/cirrus-link/4.0.22/MQTT-Transmission-signed.modl"
ARG MQTT_TRANSMISSION_MODULE_DOWNLOAD_SHA256="0c223f44e687ca03a2eb64854895bca93f4535f8bdc709995d309c8df53f1aa3"

RUN mkdir -p /modules/pre-loaded-modules && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/MQTT-Distributor.modl" "${MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_URL}" && \
	echo "${MQTT_DISTRIBUTOR_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/MQTT-Distributor.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/MQTT-Engine.modl" "${MQTT_ENGINE_MODULE_DOWNLOAD_URL}" && \
	echo "${MQTT_ENGINE_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/MQTT-Engine.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/MQTT-Transmission.modl" "${MQTT_TRANSMISSION_MODULE_DOWNLOAD_URL}" && \
	echo "${MQTT_TRANSMISSION_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/MQTT-Transmission.modl" | sha256sum -c - && \
	chown -R ${IGNITION_UID}:${IGNITION_GID} /modules

COPY --chmod=0755 secondary-versions/iiot/iiot-entrypoint-shim.sh /usr/local/bin/

ENTRYPOINT [ "iiot-entrypoint-shim.sh" ]