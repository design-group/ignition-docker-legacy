ARG IGNITION_VERSION="8.1.41"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget
ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/BusinessConnector/3.81/3.81.10SP2/Web+Service-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="17D2D1F00D4DF06325D22BD8D7C389401B6A646FEE8FBACBE41FFBB45FE48272"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="ECBD1FA4B781C87FECD8353B7DD2079F33A008F71BB3B1D5CA418E939AFA60E7"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="3ED81F38DD7435A1E02B1A65E2B31B301E4C9D48A724B901A5C24D6CB3199690"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="6730B471AF11EE7CB8340E76D88E1EF3897F1DA56F330A014080A00693EC366A"
ARG SPC_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="5A48206418B1164434E82ED51D7754DC169DC23F57A1427B6A5AB00F43CE5D2C"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="FD91ADA14879D2198FA0BC825F34DC070E0A45500AAF599B396A5620E9A37BBC"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="F11524BDF9BCBA288A8D0109BA46777BAAD9638B113E788E414DB54FBE723C9C"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.10SP2/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="5BA0EDA1CD2BBA9DD5000CC2F36C1D6E8A5EFF8A40B4817387128321A8C03C40"

# Download the SepaSoft modules and store them in the /modules/pre-loaded-modules folder
RUN mkdir -p /modules/pre-loaded-modules && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/Web+Service-module.modl" "${WEB_SERVICES_MODULE_DOWNLOAD_URL}" && \
	echo "${WEB_SERVICES_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Web+Service-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/Production-module.modl" "${PRODUCTION_MODULE_DOWNLOAD_URL}" && \
	echo "${PRODUCTION_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Production-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/Settings_and_Changeover-module.modl" "${SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL}" && \
	echo "${SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Settings_and_Changeover-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/Batch-module.modl" "${BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL}" && \
	echo "${BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Batch-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/SPC-module.modl" "${SPC_MODULE_DOWNLOAD_URL}" && \
	echo "${SPC_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/SPC-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/Document_Management-module.modl" "${DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL}" && \
	echo "${DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Document_Management-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/OEE_Downtime-module.modl" "${OEE_DOWNTIME_MODULE_DOWNLOAD_URL}" && \
	echo "${OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/OEE_Downtime-module.modl" | sha256sum -c - && \
	wget -q --ca-certificate=/etc/ssl/certs/ca-certificates.crt --referer https://s3.amazonaws.com/* -O "/modules/pre-loaded-modules/Trace-module.modl" "${TRACK_AND_TRACE_MODULE_DOWNLOAD_URL}" && \
	echo "${TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256}" "/modules/pre-loaded-modules/Trace-module.modl" | sha256sum -c - && \
	chown -R ${IGNITION_UID}:${IGNITION_GID} /modules

COPY --chmod=0755 secondary-versions/mes/mes-entrypoint-shim.sh /usr/local/bin/

ENTRYPOINT [ "mes-entrypoint-shim.sh" ]