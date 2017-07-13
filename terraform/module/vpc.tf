resource "aws_vpc" "main" {
	cidr_block = "${format("%v.0.0/16", var.cidr_address)}"
	instance_tenancy = "${var.instance_tenancy}"
	enable_dns_support = "${var.enable_dns_support}"
	enable_dns_hostnames = "${var.enable_dns_hostnames}"
	tags {
		Name = "${var.vpc_name}"
		Role = "${var.vpc_role}"
	}
}
