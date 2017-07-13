output "private_subnets" {
	value = "${data.aws_subnet_ids.private.ids}"
}

output "private_subnet_route_table" {
	value = "${aws_route_table.private.id}"
}

output "vpc" {
	value = "${aws_vpc.main.id}"
}

output "public_subnets" {
	value = "${data.aws_subnet_ids.public.ids}"
}

output "public_subnet_route_table" {
	value = "${aws_route_table.public.id}"
}

output "cidr_block" {
	value = "${aws_vpc.main.cidr_block}"
}

