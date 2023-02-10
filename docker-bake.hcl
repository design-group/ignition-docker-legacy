# docker-bake.hcl

group "build" {
	targets = [
		"8-1-13",
		"8-1-14",
		"8-1-15",
		"8-1-16",
		"8-1-17",
		"8-1-18",
		"8-1-19",
		"8-1-20",
		"8-1-21",
		"8-1-22",
		"8-1-23",
		"8-1-24",
		"iiot-8-1-24",
		"mes-8-1-22"
	]
}

group "ignition-base" {
	targets = [
		"8-1-13",
		"8-1-14",
		"8-1-15",
		"8-1-16",
		"8-1-17",
		"8-1-18",
		"8-1-19",
		"8-1-20",
		"8-1-21",
		"8-1-22",
		"8-1-23",
		"8-1-24"
	]
}

group "ignition-iiot" {
	targets = [
		"iiot-8-1-24"
	]
}

group "ignition-mes" {
	targets = [
		"mes-8-1-22"
	]
}

variable "BASE_IMAGE_NAME" {
    default = "bwdesigngroup/ignition-docker"
}

variable "BASE_VERSION" {
    default = "8.1"
}

variable "PATCH_VERSION" {
    default = 24
}

// ###########################################################################################
//  PRE-8-1-17 Imaages
// ###########################################################################################

target "pre-8-1-17-base" {
	context = "."
	dockerfile = "secondary-versions/pre-8-1-17/Dockerfile"
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

// This target inherits the pre-8-1-17-base and sets the patch to 13
target "8-1-13" {
	inherits = ["pre-8-1-17-base"]
	args = {
		IGNITION_VERSION = "8.1.13"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.13"
	]
}


// This target inherits the pre-8-1-17-base and sets the patch to 14
target "8-1-14" {
	inherits = ["pre-8-1-17-base"]
	args = {
		IGNITION_VERSION = "8.1.14"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.14"
	]
}

// This target inherits the pre-8-1-17-base and sets the patch to 15
target "8-1-15" {
	inherits = ["pre-8-1-17-base"]
	args = {
		IGNITION_VERSION = "8.1.15"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.15"
	]
}

// This target inherits the pre-8-1-17-base and sets the patch to 16
target "8-1-16" {
	inherits = ["pre-8-1-17-base"]
	args = {
		IGNITION_VERSION = "8.1.16"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.16"
	]
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

// This target inherits the 8-1-base and sets the patch to 17
target "8-1-17" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.17"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.17"
	]
}

// This target inherits the 8-1-base and sets the patch to 18
target "8-1-18" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.18"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.18"
	]
}


// This target inherits the 8-1-base and sets the patch to 19
target "8-1-19" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.19"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.19"
	]
}

// This target inherits the 8-1-base and sets the patch to 20
target "8-1-20" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.20"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.20"
	]
}

// This target inherits the 8-1-base and sets the patch to 21
target "8-1-21" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.21"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.21"
	]
}

// This target inherits the 8-1-base and sets the patch to 22
target "8-1-22" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.22"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.22",
		"${BASE_IMAGE_NAME}:latest"
	]
}

// This target inherits the 8-1-base and sets the patch to 23
target "8-1-23" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.23"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.23",
		"${BASE_IMAGE_NAME}:latest"
	]
}

// This target inherits the 8-1-base and sets the patch to 24
target "8-1-24" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.24"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.24",
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

target "iiot-8-1-24" {
	inherits = ["iiot-base"]
	args = {
		IGNITION_VERSION = "8.1.24"
	}
	tags = [
		"${BASE_IMAGE_NAME}-iiot:8.1.24",
		"${BASE_IMAGE_NAME}-iiot:latest"
	]
}

// ###########################################################################################
//  MES Imaages
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

target "mes-8-1-22" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.22"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.22",
		"${BASE_IMAGE_NAME}-mes:latest"
	]
}
