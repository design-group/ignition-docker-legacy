ARG IGNITION_VERSION="8.1.31"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

# Switch to root user to install additional packages
USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget
ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/BusinessConnector/3.81/3.81.8SP3/Web+Service-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="973D5C716D8C137568F3AEA643110F026FB62209174C0CEB16AF57D3EEE88628"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="EB607722BBA0A2BF54FB3BBF679DCDE9DD40A0C659DD74659DAA0AA7A72CAE53"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="7013FC5280A18EC6E075F9A622F07A7F1A89624FF04B5A4E0E8371E3B1E71CCD"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="45A8093F36B5366531EB47F2DBCA4F0BAE19E4C1909EE3CAA2CCAEF367A0E12A"
ARG SPC_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="24588F0A9CCA2481251B92B65FC626A8B7590558FE6D36B8710C25800001451C"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="F1A5D99B936D476A623FC426A68594910586FE0B7064FABAF54094972974859E"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="14D03819B125CDEA0720440E70BCB7520E34DDF971A8A608DB807243ACF74352"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP3/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="9B773EA5A5B1EEB2E1B20F1CBFEA3811AF4D878EA3E8424B8E7DCFA8FEADD302"

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