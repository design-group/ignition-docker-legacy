ARG IGNITION_VERSION="8.1.22"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/Web_Service-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="b3c7f2aaf963bb26152f98b9f58379c3214a6539ab3a24a8f556e087f6228167"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="28619de31a1ca3055992004ee4a0999dd10209d991381c7edb8e14ed5f63ca5b"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="034f38c47655ab68cd8c027672155f89beb06cf501bb7e6858dafd3fe592d659"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="bb7cd6275977b7a1a1d567a08d55c859096d6476feb9fa14e849c1e03998a6b7"
ARG SPC_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="39ef7e3e5a0381b5f1da52be27fe036fe7ecea06fa470e50b5aa89173fbbb0ec"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="3a4c8f202b792d4a8ffccbc8bb324259d3e0fe489d27f2716869a831b2e06eed"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="481fa661e47c742f39743f26d3946a0017b5788a44dfc43d56112ad345a0fd2b"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.6.2022112218/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="017b47ca40a00b5c20cf51d62a3e42bb2edd2d52ebd286dd4f1cec0a71b0b4d8"

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