ARG IGNITION_VERSION="8.1.20"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget

ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.2.2022081920/WebService-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="b11e7f9d53b5d40e6e0eef49099377a04b41e46166975f3249962703c248ffb7"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="3df8f41067e3d2b2448afadf86212b0bfb78cdedf71dd6a29f181896dc7e7a56"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="ad2612c7643ac1d9e2e5d588b69e88c9db401b25b1271ad8eeadea8ca37c471d"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="bfd68d2a22e7b81e233514033567c2072cd0c61b29799b2cfd65f410394cded1"
ARG SPC_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="3f75431aeba25b488efeadf6582418db6bfaa2f6f677cc98bd29c2ffaaf68f7d"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="ceb678daa7fae06b7f9cbe16766846c2988556addb4c39fd3491a9be6ebdf2db"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="d167bc088abb041579b36c460cb7a433e37a11ee2ab3954502d20ac90653d349"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://files.inductiveautomation.com/third-party/sepasoft/3.81.5.2022092821/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="afbbfb9f7925b3e2987d0f6a15d27c49eda62c7486420d5604914a5174a70e31"

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

COPY --chmod=0755 --chown=${IGNITION_UID}:${IGNITION_GID} ./mes-entrypoint-shim.sh /usr/local/bin/

# Switch back to the ignition user
USER ${IGNITION_UID}:${IGNITION_GID}

ENTRYPOINT [ "mes-entrypoint-shim.sh" ]