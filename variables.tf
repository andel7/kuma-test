variable "networkTags" {
	description = "Network tags to apply to compute instance"
	type = list(string)
	default = []
}

variable "serverList" {
	description = "List on instance names to create"
	type = list(string)
	default = []
}
variable "zone" {
	description = "zone to deploy servers"
	type = string
	default = "us-central1-a"
}
variable "machineType" {
	description = "type of the server to deploy"
	type = string
	default = "e2-medium"
}
variable "kumaVersion" {
	description = "version of the kuma binaries to download and install"
	type = string
}
variable "experimentName" {
	description = "name of the experiemnt - to add uniqueness to the name of the instances"
	type = string
}
