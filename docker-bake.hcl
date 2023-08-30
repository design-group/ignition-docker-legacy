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
		"mes-8-1-22",
		"mes-8-1-23",
		"mes-8-1-24",
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
		"mes-8-1-22",
		"mes-8-1-23",
		"mes-8-1-24",
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
		"${BASE_IMAGE_NAME}:8.1.22"
	]
}

// This target inherits the 8-1-base and sets the patch to 23
target "8-1-23" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.23"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.23"
	]
}

// This target inherits the 8-1-base and sets the patch to 24
target "8-1-24" {
	inherits = ["8-1-base"]
	args = {
		IGNITION_VERSION = "8.1.24"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.24"
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

// This target inherits the mes-base and sets the patch to 22
target "mes-8-1-22" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.22"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.22"
	]
}

// This target inherits the mes-base and sets the patch to 23
target "mes-8-1-23" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.23"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.23"
	]
}

// This target inherits the mes-base and sets the patch to 24
target "mes-8-1-24" {
	inherits = ["mes-base"]
	args = {
		IGNITION_VERSION = "8.1.24"
	}
	tags = [
		"${BASE_IMAGE_NAME}-mes:8.1.24"
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
