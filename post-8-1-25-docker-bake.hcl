# post-8-1-25-docker-bake.hcl

group "all" {
	targets = [
		"8-1-25",
		"8-1-26",
		"8-1-27",
		"8-1-28",
		"8-1-30",
		"8-1-31",
		"iiot-8-1-25",
		"iiot-8-1-26",
		"iiot-8-1-27",
		"iiot-8-1-28",
		"iiot-8-1-30",
		"iiot-8-1-31",
		"mes-8-1-25",
		"mes-8-1-26",
		"mes-8-1-27",
		"mes-8-1-28",
		"mes-8-1-30",
		"mes-8-1-31"
	]
}

group "ignition-base" {
	targets = [
		"8-1-25",
		"8-1-26",
		"8-1-27",
		"8-1-28",
		"8-1-30",
		"8-1-31"
	]
}

group "ignition-iiot" {
	targets = [
		"iiot-8-1-25",
		"iiot-8-1-26",
		"iiot-8-1-27",
		"iiot-8-1-28",
		"iiot-8-1-30",
		"iiot-8-1-31"
	]
}

group "ignition-mes" {
	targets = [
		"mes-8-1-25",
		"mes-8-1-26",
		"mes-8-1-27",
		"mes-8-1-28",
		"mes-8-1-30",
		"mes-8-1-31"
	]
}

variable "BASE_IMAGE_NAME" {
    default = "bwdesigngroup/ignition-docker"
}

variable "BASE_VERSION" {
    default = "8.1"
}

variable "PATCH_VERSION" {
    default = 31
}

// ###########################################################################################
//  Current Images
// ###########################################################################################

target "8-1-base" {
	context = "."
	args = {
		IGNITION_VERSION = "${BASE_VERSION}.${PATCH_VERSION}"
	}
	platforms = [
		"linux/amd64", 
		"linux/arm64", 
		"linux/arm",
	]
	tags = [
		"${BASE_IMAGE_NAME}:${BASE_VERSION}.${PATCH_VERSION}"
	]
}

// This target inherits the 8-1-base and sets the patch to 25
target "8-1-25" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.25"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.25"
	]
}

// This target inherits the 8-1-base and sets the patch to 26
target "8-1-26" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.26"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.26"
	]
}

// This target inherits the 8-1-base and sets the patch to 27
target "8-1-27" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.27"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.27"
	]
}

// This target inherits the 8-1-base and sets the patch to 28
target "8-1-28" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.28"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.28"
	]
}

// This target inherits the 8-1-base and sets the patch to 30
target "8-1-30" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.30"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.30"
	]
}

// This target inherits the 8-1-base and sets the patch to 31
target "8-1-31" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.31"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.31",
		"${BASE_IMAGE_NAME}:latest"
	]
}

// ###########################################################################################
//  IIOT Imaages
// ###########################################################################################

target "iiot-base" {
	context = "."
	dockerfile = "secondary-versions/iiot/Dockerfile"
	args = {
		IGNITION_VERSION = "${BASE_VERSION}.${PATCH_VERSION}"
	}
	platforms = [
		"linux/amd64", 
		"linux/arm64", 
		"linux/arm",
	]
	tags = [
		"${BASE_IMAGE_NAME}-iiot:${BASE_VERSION}.${PATCH_VERSION}"
	]
}

// This target inherits the iiot-base and sets the patch to 25
target "iiot-8-1-25" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.25"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.25"
	]
}

// This target inherits the iiot-base and sets the patch to 26
target "iiot-8-1-26" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.26"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.26"
	]
}

// This target inherits the iiot-base and sets the patch to 27
target "iiot-8-1-27" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.27"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.27"
	]
}

// This target inherits the iiot-base and sets the patch to 28
target "iiot-8-1-28" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.28"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.28"
	]
}

// This target inherits the iiot-base and sets the patch to 30
target "iiot-8-1-30" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.30"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.30"
	]
}

// This target inherits the iiot-base and sets the patch to 31
target "iiot-8-1-31" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.31"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.31",
		"${BASE_IMAGE_NAME}-iiot:latest"
	]
}

// ###########################################################################################
//  MES Images
// ###########################################################################################

target "mes-base" {
	context = "."
	dockerfile = "secondary-versions/mes/Dockerfile"
	args = {
		IGNITION_VERSION = "${BASE_VERSION}.${PATCH_VERSION}"
	}
	platforms = [
		"linux/amd64", 
		"linux/arm64", 
		"linux/arm",
	]
	tags = [
		"${BASE_IMAGE_NAME}-mes:${BASE_VERSION}.${PATCH_VERSION}"
	]
}

// This target inherits the mes-base and sets the patch to 25
target "mes-8-1-25" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.25"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.25"
	]
}

// This target inherits the mes-base and sets the patch to 26
target "mes-8-1-26" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.26"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.26"
	]
}

// This target inherits the mes-base and sets the patch to 27
target "mes-8-1-27" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.27"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.27"
	]
}

// This target inherits the mes-base and sets the patch to 28
target "mes-8-1-28" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.28"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.28"
	]
}

// This target inherits the mes-base and sets the patch to 30
target "mes-8-1-30" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.30"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.30"
	]
}

// This target inherits the mes-base and sets the patch to 31
target "mes-8-1-31" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.31"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.31",
		"${BASE_IMAGE_NAME}-mes:latest"
	]
}
