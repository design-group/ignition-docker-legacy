#!/usr/bin/env bash

MES_MODULES_ENABLED=${MES_MODULES_ENABLED:-production,oee-downtime}



main() {

	enable_mes_modules

	echo "Starting entrypoint-shim with args: $*"
	exec entrypoint-shim.sh "$@"
}

###############################################################################
# Go any additional modules that are enabled and copy them into the user lib
###############################################################################
enable_mes_modules() {

	declare -A module_definition_mappings=(
        ["webservice"]="WebService.modl"
		["production"]="Production.modl"
		["settings-and-changeover"]="Settings_and_Changeover.modl"
		["batch"]="Batch.modl"
		["spc"]="SPC.modl"
		["document-management"]="Document_Management.modl"
		["oee-downtime"]="OEE_Downtime.modl"
		["track-and-trace"]="Trace.modl"
	)

	for module in ${MES_MODULES_ENABLED//,/ }; do
		# If the module exists in pre-loaded-modules, copy it to ${IGNITION_INSTALL_LOCATION}/user-lib/modules/  
		if [ -f "/modules/pre-loaded-modules/${module_definition_mappings[$module]}" ]; then
			echo "Copying module ${module_definition_mappings[$module]} to /modules/"
			mv "/modules/pre-loaded-modules/${module_definition_mappings[$module]}" "/modules/"
		fi
	done

	rm -rf /modules/pre-loaded-modules
}

main "$@"
