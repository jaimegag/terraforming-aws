variable "env_name" {}

variable "dns_suffix" {}

variable "dns_zone_id" {}

variable "hosted_zone" {
  default = ""
}

variable "access_key" {}

variable "secret_key" {}

variable "region" {}

variable "availability_zones" {
  type = "list"
}

variable "vpc_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
}

variable "vpc_id" {}

variable "public_subnet_ids" {
  type = "list"
}

variable "private_route_table_ids" {
  type = "list"
}

/*******************
* SSL Certificates *
********************/

variable "ssl_cert" {
  type        = "string"
  description = "the contents of an SSL certificate to be used by the PKS API, optional if `ssl_ca_cert` is provided"
  default     = ""
}

variable "ssl_private_key" {
  type        = "string"
  description = "the contents of an SSL private key to be used by the PKS API, optional if `ssl_ca_cert` is provided"
  default     = ""
}

variable "ssl_ca_cert" {
  type        = "string"
  description = "the contents of a CA public key to be used to sign the generated PKS API certificate, optional if `ssl_cert` is provided"
  default     = ""
}

variable "ssl_ca_private_key" {
  type        = "string"
  description = "the contents of a CA private key to be used to sign the generated PKS API certificate, optional if `ssl_cert` is provided"
  default     = ""
}

/*******
* Tags *
********/

variable "tags" {
  type        = "map"
  default     = {}
  description = "Key/value tags to assign to all AWS resources"
}
