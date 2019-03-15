output "iaas" {
  value = "aws"
}

output "vpc_id" {
  value = "${var.vpc_id}"
}

output "network_name" {
  value = "${var.vpc_id}"
}

output "region" {
  value = "${var.region}"
}

output "azs" {
  value = "${var.availability_zones}"
}

output "ssl_cert" {
  sensitive = true
  value     = "${module.certs.ssl_cert}"
}

output "ssl_private_key" {
  sensitive = true
  value     = "${module.certs.ssl_private_key}"
}

output "dns_zone_id" {
  value = "${var.dns_zone_id}"
}

# PKS ==========================================================================

output "pks_api_endpoint" {
  value = "${module.pks.domain}"
}

output "pks_subnet_ids" {
  value = "${module.pks.pks_subnet_ids}"
}

output "pks_subnets" {
  value = "${module.pks.pks_subnet_ids}"
}

output "pks_subnet_availability_zones" {
  value = "${module.pks.pks_subnet_availability_zones}"
}

output "pks_subnet_cidrs" {
  value = "${module.pks.pks_subnet_cidrs}"
}

output "pks_subnet_gateways" {
  value = "${module.pks.pks_subnet_gateways}"
}

output "pks_master_iam_instance_profile_name" {
  value = "${module.pks.pks_master_iam_instance_profile_name}"
}

output "pks_worker_iam_instance_profile_name" {
  value = "${module.pks.pks_worker_iam_instance_profile_name}"
}

output "pks_master_security_group_id" {
  value = "${module.pks.pks_master_security_group_id}"
}

output "pks_api_target_groups" {
  value = "${module.pks.pks_api_target_groups}"
}

# PKS Services =================================================================

output "pks_services_subnet_ids" {
  value = "${module.pks.pks_services_subnet_ids}"
}

output "pks_services_subnets" {
  value = "${module.pks.pks_services_subnet_ids}"
}

output "pks_services_subnet_availability_zones" {
  value = "${module.pks.pks_services_subnet_availability_zones}"
}

output "pks_services_subnet_cidrs" {
  value = "${module.pks.pks_services_subnet_cidrs}"
}

output "pks_services_subnet_gateways" {
  value = "${module.pks.pks_services_subnet_gateways}"
}
