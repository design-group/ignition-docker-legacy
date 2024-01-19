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
        ["webservice"]="Web+Service-module.modl"
		["production"]="Production-module.modl"
		["settings-and-changeover"]="Settings_and_Changeover-module.modl"
		["batch"]="Batch-module.modl"
		["spc"]="SPC-module.modl"
		["document-management"]="Document_Management-module.modl"
		["oee-downtime"]="OEE_Downtime-module.modl"
		["track-and-trace"]="Trace-module.modl"
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
