ARG IGNITION_VERSION="8.1.32"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget
ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/BusinessConnector/3.81/3.81.8SP4/Web+Service-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="850100ED0740280E01AE8CACD0D7A7C9E4A329876AD956EC677D436665616685"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="BEB6C875DAE09F24B8E18BBDECD155EDF06C18396B79E80B7E963BA7370B3F84"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="1DFC931F441B091DC6072D0BFA0FAA4C2590AC5412EF862B239F98A050264AAA"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="BD9A6141871960C14C74BC6EDF48A7828EFC3E44DF6C6ABF97EEED402923C6AD"
ARG SPC_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="412286421B05A1D61BAB2278AA445E7AFC17591AB1E7A9128726B0D19F6C0889"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="3D228395D01572BA448F66109504A4F24D565A32517448F1EE340E311132F19B"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="D49868C748AC0142EE68D1B51740864E00A4A553D95F74F35215916198A70002"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.8SP4/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="D7237C25ADA1262931DD3ABEFC4CBF7843537BB52547186C8E1D625E74DA3C70"

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