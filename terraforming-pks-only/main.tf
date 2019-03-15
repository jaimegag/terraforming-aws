provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

terraform {
  required_version = "< 0.12.0"
}

locals {
  bucket_suffix = "${random_integer.bucket.result}"

  default_tags = {
    Environment = "${var.env_name}"
    Application = "Cloud Foundry"
  }

  actual_tags = "${merge(var.tags, local.default_tags)}"
}

resource "random_integer" "bucket" {
  min = 1
  max = 100000
}

module "certs" {
  source = "../modules/certs"

  subdomains = ["*.pks"]
  env_name   = "${var.env_name}"
  dns_suffix = "${var.dns_suffix}"

  ssl_cert           = "${var.ssl_cert}"
  ssl_private_key    = "${var.ssl_private_key}"
  ssl_ca_cert        = "${var.ssl_ca_cert}"
  ssl_ca_private_key = "${var.ssl_ca_private_key}"
}

module "pks" {
  source = "../modules/pks-only"

  env_name                = "${var.env_name}"
  region                  = "${var.region}"
  availability_zones      = "${var.availability_zones}"
  vpc_cidr                = "${var.vpc_cidr}"
  vpc_id                  = "${var.vpc_id}"
  private_route_table_ids = "${var.private_route_table_ids}"
  public_subnet_ids       = "${var.public_subnet_ids}"

  zone_id    = "${var.dns_zone_id}"
  dns_suffix = "${var.dns_suffix}"

  tags = "${local.actual_tags}"
}
