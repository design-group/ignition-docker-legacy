# docker-bake.hcl

group "build" {
	targets = [
		"current"
		, "pre-8-1-17"
		, "mes"
		, "iiot"
	]
}

variable "BASE_IMAGE_NAME" {
    default = "bwdesigngroup/ignition-docker"
}

variable "BASE_VERSION" {
    default = "8.1"
}

variable "LATEST_IGNITION_VERSION" {
    default = 22
}

variable "LATEST_MES_VERSION" {
    default = 20
}

variable "LATEST_IIOT_VERSION" {
    default = 21
}

target "current" {
	for_each = range(17, ${LATEST_IGNITION_VERSION})
    context = "."
	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.${each.value}"]
    cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}:cache-${BASE_VERSION}.${each.value}"]
    platforms = [
        "linux/amd64", 
        "linux/arm64", 
        "linux/arm",
    ]
	 tags = [
        "${BASE_IMAGE_NAME}:${BASE_VERSION}.${each.value}"
    ]
}


target "pre-8-1-17" {
	for_each = range(13, 16)
    context = "secondary-versions/pre-8-1-17"
	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}-pre-8-1-17:cache-${BASE_VERSION}.${each.value}"]
    cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}-pre-8-1-17:cache-${BASE_VERSION}.${each.value}"]
    platforms = [
        "linux/amd64", 
        "linux/arm64", 
        "linux/arm",
    ]
	 tags = [
        "${BASE_IMAGE_NAME}-pre-8.1.17:${BASE_VERSION}.${each.value}"
    ]
}

target "mes" {
    context = "secondary-versions/mes"
	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}-mes:cache-${BASE_VERSION}.${LATEST_MES_VERSION}"]
    cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}-mes:cache-${BASE_VERSION}.${LATEST_MES_VERSION}"]
    platforms = [
        "linux/amd64", 
        "linux/arm64", 
        "linux/arm",
    ]
	 tags = [
        "${BASE_IMAGE_NAME}:${BASE_VERSION}-mes.${LATEST_MES_VERSION}"
    ]
}

target "iiot" {
    context = "secondary-versions/iiot"
	cache-to = ["type=registry,ref=${BASE_IMAGE_NAME}-iiot:cache-${BASE_VERSION}.${LATEST_IIOT_VERSION}"]
    cache-from = ["type=registry,ref=${BASE_IMAGE_NAME}-iiot:cache-${BASE_VERSION}.${LATEST_IIOT_VERSION}"]
    platforms = [
        "linux/amd64", 
        "linux/arm64", 
        "linux/arm",
    ]
	 tags = [
        "${BASE_IMAGE_NAME}:${BASE_VERSION}-iiot.${LATEST_IIOT_VERSION}"
    ]
}