# vpc

AWS CloudFormation script that creates a VPC, Internet Gateway and NAT Gateway.

The VPC will contain 1 public subnet, and a selectable number of private subnets (1 - 6).  The public
subnet will have a route table that provides 0.0.0.0/0 access via the Internet Gateway, and the private subnets
will share a second route table that privates 0.0.0.0/0 access via the NAT Gateway.

Each of the private subnets have 4091 IP addresses available.


## Arguments

| Argument           | Description                                                        |
| ------------------ |:------------------------------------------------------------------:|
| CidrAddress        | First 2 elements of CIDR block, which is extended to be X.Y.0.0/16 |
| EnableDnsHostnames | Whether EC2 instances will have DNS hostnames applied              |
| EnableDnsSupport   | Whether or not DNS is supported                                    |
| InstanceTenancy    | Type of EC2 instance tenancy                                       |
| PrivateSubnetCount | The number of private subnets to be created (1-6 can be selected)  |


## Outputs

The reference to the VPC and its full CIDR block are returned, to facilitate subsequent VPC Peering.

The list of private subnets is also returned.

## Licence

This project is released under the MIT license. See [LICENSE](LICENSE) for details.
