variable "create_public_subnet" {
        default = false
	description = "Whether a public (internet facing) subnet should be created"
}

variable "private_subnet_count" {
        default = 0
	description = "Number of private subnets to create in the VPC"
}

variable "cidr_address" {
        default = "171.56"
	description = "Initial two values for CIDR address for the VPC, which will be expanded X.Y.0.0/16"
}

variable "enable_dns_hostnames" {
        default = false
	description = "Whether or not DNS hostnames will be created"
}

variable "enable_dns_support" {
        default = true
	description = "Whether or not DNS is supported"
}

variable "instance_tenancy" {
        default = "default"
	description = "Type of instance tenancy"
}

variable "multiple_nat_gateways" {
	default = false
	description = "Whether a NAT Gateway should be created in each public subnet, with multiple private Route Tables"
}

variable "vpc_name" {
        default = ""
	description = "Optional name to assign to the 'Name' tag of the VPC"
}

variable "vpc_role" {
        default = ""
	description = "Optional role to assigned to the 'Role' tag of the VPC"
}

