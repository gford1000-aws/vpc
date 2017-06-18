# vpc

AWS CloudFormation script that creates a VPC, Internet Gateway and NAT Gateway.

The VPC may contain 3 public subnets, and/or a selectable number of private subnets (0-6).

If public and private subnets are selected, then the private subnets have access to the internet via
NAT Gateway.  By default, only a single NAT Gateway will be created, and the private subnets share a
single route table to it.  However, if `MultipleNATGateways` is set to `true`, then 3 NAT Gateways will
be created (one in each public subnet), along with 3 route tables.  The private subnets are associated with
the relevant route table such that the public/private subnets are in the same Availability Zone.

Each public subnet has 58 IP addresses available, while each private subnet has 4091 IP addresses available.

## Arguments

| Argument            | Description                                                        |
| ------------------- |:------------------------------------------------------------------:|
| CidrAddress         | First 2 elements of CIDR block, which is extended to be X.Y.0.0/16 |
| CreatePublicSubnet  | Whether a public subnet should be created (with IG & NAT)          |
| EnableDnsHostnames  | Whether EC2 instances will have DNS hostnames applied              |
| EnableDnsSupport    | Whether or not DNS is supported                                    |
| InstanceTenancy     | Type of EC2 instance tenancy                                       |
| MultipleNATGateways | If true, then 3 NAT Gateways are created                           |
| PrivateSubnetCount  | The number of private subnets to be created (0-6 can be selected)  |


## Outputs

| Output                  | Description                                                    |
| ----------------------- |:--------------------------------------------------------------:|
| CidrBlock               | The full CIDR block of the VPC                                 |
| PrivateSubnetRouteTable | The route table(s) associated with each of the private subnets |
| PrivateSubnets          | The list of private subnets (if any created)                   |
| PublicSubnetRouteTable  | The route table associated with the public subnet              |
| PublicSubnets           | The public subnets                                             |
| VPC                     | The reference to the VPC                                       |

The route tables and VPC are returned to allow subsequent VPC Peering.

The subnets are returned to allow flow logs to be attached, and for use in Autoscaling Groups and Lambda VPC associations.

## Licence

This project is released under the MIT license. See [LICENSE](LICENSE) for details.
