ARG IGNITION_VERSION="8.1.20"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/Web_Service-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="4d10f426715ece135d96473e1d8ea1ca651aa1d612332ab52eb22d234f9d030a"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="b3612a7b1cebe4f9b5fbf553cde85fe87de78e3b1b0cea338c7056586eef7b9d"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="bc0e686630a324c66da8397cf099aaf7de52cc579cc1fb76a09151e0ad208a66"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="abf2bca9b45086d1fb9d78f57595ce6e3f924c183836e7440c132f15a39f3762"
ARG SPC_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="8f597843e765997d4a57a7bf76018a651c019d85e4499359692eddbf29c84ea3"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="09a7e327dd865dddc8715e54ef88f7d691e71add10ee35d11e07b319dd710a64"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="6dd14f775030206189c72e3c7504fb7983283757c0738d3269f53e25a74b26e1"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022110119/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="4fed01d4f4e081f88dc1d0715a142e5f60668b6ba372eb7f6ae5128be926f257"

# Download the MQTT modules and store them in the /modules/pre-loaded-modules folder
RUN mkdir -p /modules/pre-loaded-modules && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/WebService.modl" "${WEB_SERVICES_MODULE_DOWNLOAD_URL}" && \
	echo "${WEB_SERVICES_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/WebService.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/Production.modl" "${PRODUCTION_MODULE_DOWNLOAD_URL}" && \
	echo "${PRODUCTION_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Production.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/Settings_and_Changeover.modl" "${SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL}" && \
	echo "${SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Settings_and_Changeover.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/Batch.modl" "${BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL}" && \
	echo "${BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Batch.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/SPC.modl" "${SPC_MODULE_DOWNLOAD_URL}" && \
	echo "${SPC_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/SPC.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/Document_Management.modl" "${DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL}" && \
	echo "${DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Document_Management.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/OEE_Downtime.modl" "${OEE_DOWNTIME_MODULE_DOWNLOAD_URL}" && \
	echo "${OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/OEE_Downtime.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://inductiveautomation.com/* -O "/modules/pre-loaded-modules/Trace.modl" "${TRACK_AND_TRACE_MODULE_DOWNLOAD_URL}" && \
	echo "${TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Trace.modl" | sha256sum -c - && \
	chown -R ${IGNITION_UID}:${IGNITION_GID} /modules

COPY --chmod=0755 --chown=${IGNITION_UID}:${IGNITION_GID} secondary-versions/mes/mes-entrypoint-shim.sh /usr/local/bin/

# Switch back to the ignition user
USER ${IGNITION_UID}:${IGNITION_GID}

ENTRYPOINT [ "mes-entrypoint-shim.sh" ]