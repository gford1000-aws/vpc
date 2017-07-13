resource "aws_route_table" "private" {
	count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 0 : 1) : 0) : (var.private_subnet_count > 0 ? 1 : 0)}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private_0" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private_1" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 1 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private_2" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 2 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private_3" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 3 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private_4" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 4 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "private_5" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 5 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_subnet" "private" {
	count = "${var.private_subnet_count}"
        tags {
                Name = "${format("Private-Subnet-%d", count.index)}"
		Tier = "Private"
        }
        vpc_id = "${aws_vpc.main.id}"
        cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 4, count.index)}"
	availability_zone = "${element(concat(data.aws_availability_zones.available.names, data.aws_availability_zones.available.names, data.aws_availability_zones.available.names), count.index)}"
}

data "aws_subnet_ids" "private" {
	count = "${var.private_subnet_count > 0 ? 1 : 0}"
	vpc_id = "${aws_vpc.main.id}"
	tags {
		Tier = "Private"
	}
	depends_on = [ "aws_subnet.private" ]
}

resource "aws_route_table_association" "private_rta" {
	count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 0 : var.private_subnet_count) : 0) : var.private_subnet_count}"
	subnet_id = "${element(data.aws_subnet_ids.private.ids, count.index)}"
	route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_rta_0" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 0 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        subnet_id = "${element(data.aws_subnet_ids.private.ids, 0)}"
        route_table_id = "${aws_route_table.private_0.id}"
}

resource "aws_route_table_association" "private_rta_1" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 1 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        subnet_id = "${element(data.aws_subnet_ids.private.ids, 1)}"
        route_table_id = "${aws_route_table.private_1.id}"
}

resource "aws_route_table_association" "private_rta_2" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 2 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        subnet_id = "${element(data.aws_subnet_ids.private.ids, 2)}"
        route_table_id = "${aws_route_table.private_2.id}"
}

resource "aws_route_table_association" "private_rta_3" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 3 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        subnet_id = "${element(data.aws_subnet_ids.private.ids, 3)}"
        route_table_id = "${aws_route_table.private_3.id}"
}

resource "aws_route_table_association" "private_rta_4" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 4 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        subnet_id = "${element(data.aws_subnet_ids.private.ids, 4)}"
        route_table_id = "${aws_route_table.private_4.id}"
}

resource "aws_route_table_association" "private_rta_5" {
        count = "${var.create_public_subnet ? (var.private_subnet_count > 5 ? (var.multiple_nat_gateways ? 1 : 0) : 0) : 0}"
        subnet_id = "${element(data.aws_subnet_ids.private.ids, 5)}"
        route_table_id = "${aws_route_table.private_5.id}"
}

