ARG IGNITION_VERSION="8.1.35"
FROM bwdesigngroup/ignition-docker:${IGNITION_VERSION:-latest}

USER root

# Install some prerequisite packages
RUN apt-get update && apt-get install -y wget
ARG WEB_SERVICES_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/BusinessConnector/3.81/3.81.9SP1/Web+Service-module.modl"
ARG WEB_SERVICES_MODULE_DOWNLOAD_SHA256="3125C9C4A2BDBA6D4BB54972493E2944EAC072886BA80A0B3880CE4AED722A91"
ARG PRODUCTION_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/Production-module.modl"
ARG PRODUCTION_MODULE_DOWNLOAD_SHA256="ED51B41FA887A711DEF1CF7442BE39FADBD4AC0EAB2795B7079574C935B27818"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/Settings_and_Changeover-module.modl"
ARG SETTINGS_AND_CHANGEOVER_MODULE_DOWNLOAD_SHA256="42F068E68CA69E9E96C5E52BA28EE177B5FF223C781BE20AF4A81631AFB25929"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/Batch-module.modl"
ARG BATCH_AND_PROCEDURE_MODULE_DOWNLOAD_SHA256="65BEC648E059EC5D12FE1C2288B9C803FEFC6C593E6BC936F053E56BCD8EAE76"
ARG SPC_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/SPC-module.modl"
ARG SPC_MODULE_DOWNLOAD_SHA256="AD63CFDDF5D28060294934929BF96BB848067DA39B4353AF2FE24A70F6D68FE1"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/Document_Management-module.modl"
ARG DOCUMENT_MANAGEMENT_MODULE_DOWNLOAD_SHA256="F3C024AE60FF7C586B429855461A43D7A3ED7D96E796E43E1A4E267F52050708"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/OEE_Downtime-module.modl"
ARG OEE_DOWNTIME_MODULE_DOWNLOAD_SHA256="A7115917D11B31FEED380902AC3977F53EF708DB1197F3867CA4994E3A9D38AD"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_URL="https://s3.amazonaws.com/files.sepasoft.com/mes/updates/Versions/MES/3.81/3.81.9SP1/Trace-module.modl"
ARG TRACK_AND_TRACE_MODULE_DOWNLOAD_SHA256="67B6B995852D2DA828839AE5CBCBA96812F1B39B091838FBDD7778957903C4B0"

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