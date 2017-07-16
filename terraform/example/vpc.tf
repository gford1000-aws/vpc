module "vpc" {
        source = "github.com/gford1000-aws/terraform//aws/vpc"

        cidr_address = "10.0"
        private_subnet_count = 1
        create_public_subnet = true
        vpc_name = "MyNewVPC"
        multiple_nat_gateways = false
}

output "vpc_id" {
        value = "${module.vpc.vpc}"
}

output "public_subnets" {
        value = "${module.vpc.public_subnets}"
}

output "private_subnets" {
        value = "${module.vpc.private_subnets}"
}
