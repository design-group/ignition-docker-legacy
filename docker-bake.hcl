# docker-bake.hcl

group "build" {
	targets = [
		"8-1-16",
		"8-1-17"
	]
}

variable "BASE_IMAGE_NAME" {
    default = "bwdesigngroup/ignition-docker"
}

variable "BASE_VERSION" {
    default = "8.1"
}

variable "PATCH_VERSION" {
    default = 22
}


target "8-1-base" {
	context = .
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

// This target inherits the 8-1-base and sets the patch to 16
target "8-1-16" {
	inherits = ["8-1-base"]
	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.16"]
	cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.16"]
	args = {
		IGNITION_VERSION = "8.1.16"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.16"
	]
}

// This target inherits the 8-1-base and sets the patch to 17
target "8-1-17" {
	inherits = ["8-1-base"]
	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.17"]
	cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.17"]
	args = {
		IGNITION_VERSION = "8.1.17"
	}
	tags = [
		"${BASE_IMAGE_NAME}:8.1.17"
	]
}






// target "current" {
// 	context = "."
// 	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.${each.value}"]
// 	cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.${each.value}"]
// 	args = {
// 		IGNITION_VERSION = "${BASE_VERSION}.${each.value}"
// 	}
// 	platforms = [
// 		"linux/amd64", 
// 		"linux/arm64", 
// 		"linux/arm",
// 	]
// 		tags = [
// 		"${BASE_IMAGE_NAME}:${BASE_VERSION}.${each.value}"
// 	]
// }


// target "pre-8-1-17" {
// 	context = "secondary-versions/pre-8-1-17"
// 	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}-pre-8-1-17:cache-${BASE_VERSION}.${PATCH_VERSION}"]
// 	cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}-pre-8-1-17:cache-${BASE_VERSION}.${PATCH_VERSION}"]
// 	args = {
// 		IGNITION_VERSION = "${BASE_VERSION}.${PATCH_VERSION}"
// 	}
// 	platforms = [
// 		"linux/amd64", 
// 		"linux/arm64", 
// 		"linux/arm",
// 	]
// 		tags = [
// 		"${BASE_IMAGE_NAME}-pre-8.1.17:${BASE_VERSION}.${PATCH_VERSION}"
// 	]
// }

// target "mes" {
// 	context = "secondary-versions/mes"
// 	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}-mes:cache-${BASE_VERSION}.${PATCH_VERSION}"]
// 	cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}-mes:cache-${BASE_VERSION}.${PATCH_VERSION}"]
// 	args = {
// 		IGNITION_VERSION = "${BASE_VERSION}.${PATCH_VERSION}"
// 	}
// 	platforms = [
// 		"linux/amd64", 
// 		"linux/arm64", 
// 		"linux/arm",
// 	]
// 		tags = [
// 		"${BASE_IMAGE_NAME}:${BASE_VERSION}-mes.${PATCH_VERSION}"
// 	]
// }

// target "iiot" {
// 	context = "secondary-versions/iiot"
// 	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}-iiot:cache-${BASE_VERSION}.${PATCH_VERSION}"]
// 	cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}-iiot:cache-${BASE_VERSION}.${PATCH_VERSION}"]
// 	args = {
// 		IGNITION_VERSION = "${BASE_VERSION}.${PATCH_VERSION}"
// 	}
// 	platforms = [
// 		"linux/amd64", 
// 		"linux/arm64", 
// 		"linux/arm",
// 	]
// 		tags = [
// 		"${BASE_IMAGE_NAME}:${BASE_VERSION}-iiot.${PATCH_VERSION}"
// 	]
// }