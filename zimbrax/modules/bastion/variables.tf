variable "vpc_id" {
  type = "string"
}

variable "public_subnet_id" {
  type = "string"
}

variable "deployer_key_pair_id" {
  type = "string"
}

variable "user_public_keys" {
  type = "list"
}

variable "r53_zone_id" {
  type = "string"
}

variable "file_system" {
  type = "map"
}

variable "swarm" {
  type = "map"
}

locals {
  environment  = "${terraform.workspace}"
  env_prefix_d = "${terraform.workspace == "prod" ? "" : "${terraform.workspace}-"}"
  env_prefix_u = "${terraform.workspace == "prod" ? "" : "${terraform.workspace}_"}"

  vpc_id           = "${var.vpc_id}"
  public_subnet_id = "${var.public_subnet_id}"

  deployer_key_pair_id = "${var.deployer_key_pair_id}"
  user_public_keys     = "${var.user_public_keys}"

  r53_zone_id = "${var.r53_zone_id}"

  file_system_id                = "${lookup(var.file_system, "id")}"
  file_system_security_group_id = "${lookup(var.file_system, "security_group_id")}"

  swarm_dockerhost_private_ip = "${lookup(var.swarm, "dockerhost_private_ip")}"
  swarm_security_group_id     = "${lookup(var.swarm, "security_group_id")}"
}
