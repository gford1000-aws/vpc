resource "aws_eip" "nat_eip" {
	count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 0 : 1) : 0) : 0}"
}

resource "aws_nat_gateway" "gw" {
	count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 0 : 1) : 0) : 0}"
	allocation_id = "${aws_eip.nat_eip.id}"
	subnet_id     = "${element(data.aws_subnet_ids.public.ids, 0)}"
}

resource "aws_route" "private_nat" {
	count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 0 : 1) : 0) : 0}"
        route_table_id = "${aws_route_table.private.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw.id}"
}

resource "aws_eip" "nat_eip_1" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
}

resource "aws_nat_gateway" "gw_1" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        allocation_id = "${aws_eip.nat_eip_1.id}"
        subnet_id     = "${element(data.aws_subnet_ids.public.ids, 0)}"
}

resource "aws_eip" "nat_eip_2" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
}

resource "aws_nat_gateway" "gw_2" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        allocation_id = "${aws_eip.nat_eip_2.id}"
        subnet_id     = "${element(data.aws_subnet_ids.public.ids, 1)}"
}

resource "aws_eip" "nat_eip_3" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
}

resource "aws_nat_gateway" "gw_3" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        allocation_id = "${aws_eip.nat_eip_3.id}"
        subnet_id     = "${element(data.aws_subnet_ids.public.ids, 2)}"
}

resource "aws_route" "private_nat_0" {
	count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        route_table_id = "${aws_route_table.private_0.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw_1.id}"
}

resource "aws_route" "private_nat_1" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 1 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        route_table_id = "${aws_route_table.private_1.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw_2.id}"
}

resource "aws_route" "private_nat_2" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 2 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        route_table_id = "${aws_route_table.private_2.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw_3.id}"
}

resource "aws_route" "private_nat_3" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 3 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        route_table_id = "${aws_route_table.private_3.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw_1.id}"
}

resource "aws_route" "private_nat_4" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 4 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        route_table_id = "${aws_route_table.private_4.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw_2.id}"
}

resource "aws_route" "private_nat_5" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 5 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        route_table_id = "${aws_route_table.private_5.id}"
        destination_cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw_3.id}"
}
