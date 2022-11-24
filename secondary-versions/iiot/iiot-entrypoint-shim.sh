#!/usr/bin/env bash

IIOT_MODULES_ENABLED=${IIOT_MODULES_ENABLED:-mqtt-engine}

main() {

	enable_iiot_modules

	echo "Starting entrypoint-shim with args: $*"
	exec entrypoint-shim.sh "$*"
}

###############################################################################
# Go any additional modules that are enabled and copy them into the user lib
###############################################################################
enable_iiot_modules() {
	declare -A module_definition_mappings=(
        ["mqtt-transmission"]="MQTT-Transmission.modl"
		["mqtt-distributor"]="MQTT-Distributor.modl"
		["mqtt-engine"]="MQTT-Engine.modl"
	)

	for module in ${IIOT_MODULES_ENABLED//,/ }; do
		# If the module exists in pre-loaded-modules, copy it to ${IGNITION_INSTALL_LOCATION}/user-lib/modules/  
		if [ -f "/modules/pre-loaded-modules/${module_definition_mappings[$module]}" ]; then
			echo "Copying module ${module_definition_mappings[$module]} to /modules/"
			mv "/modules/pre-loaded-modules/${module_definition_mappings[$module]}" "/modules/"
		fi
	done

	rm -rf /modules/pre-loaded-modules
}

main "$@"