# vpc - Terraform

This is the [terraform](https://www.terraform.io/)  equivalent of the AWS CloudFormation script.  Note that currently, FlowLogs are not supported.

The VPC may contain 3 public subnets, and/or a selectable number of private subnets (0-6).

If public and private subnets are selected, then the private subnets have access to the internet via
NAT Gateway.  By default, only a single NAT Gateway will be created, and the private subnets share a
single route table to it.  However, if `MultipleNATGateways` is set to `true`, then 3 NAT Gateways will
be created (one in each public subnet), along with 3 route tables.  The private subnets are associated with
the relevant route table such that the public/private subnets are in the same Availability Zone.

Each public subnet has 251 IP addresses available, while each private subnet has 4091 IP addresses available.

## Arguments

| Argument              | Description                                                                 |
| --------------------- |:---------------------------------------------------------------------------:|
| cidr_address          | First 2 elements of CIDR block, which is extended to be X.Y.0.0/16          |
| create_public_subnet  | Whether a public subnet should be created (with IG & NAT)                   |
| enable_dns_hostnames  | Whether EC2 instances will have DNS hostnames applied                       |
| enable_dns_support    | Whether or not DNS is supported                                             |
| instance_tenancy      | Type of EC2 instance tenancy                                                |
| multiple_nat_gateways | If true, then 3 NAT Gateways are created                                    |
| private_subnet_count  | The number of private subnets to be created (0-6 can be selected)           |
| vpc_name              | The value for the Name tag of the VPC                                       |
| vpc_role              | The value for the Role tag of the VPC                                       |


## Outputs

| Output                     | Description                                                    |
| -------------------------- |:--------------------------------------------------------------:|
| cidr_block                 | The full CIDR block of the VPC                                 |
| private_subnet_route_table | The route table(s) associated with each of the private subnets |
| private_subnets            | The list of private subnets (if any created)                   |
| public_subnet_route_table  | The route table associated with the public subnet              |
| public_subnets             | The public subnets                                             |
| vpc                        | The reference to the VPC                                       |

The route tables and VPC are returned to allow subsequent VPC Peering.

The subnets are returned to allow flow logs to be attached, and for use in Autoscaling Groups and Lambda VPC associations.

## Licence

This project is released under the MIT license. See [LICENSE](LICENSE) for details.
