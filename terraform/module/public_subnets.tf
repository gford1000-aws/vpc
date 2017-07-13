resource "aws_internet_gateway" "gw" {
        count = "${var.create_public_subnet ? 1 : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "public" {
        count = "${var.create_public_subnet ? 1 : 0}"
        vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route" "internet_access" {
        count = "${var.create_public_subnet ? 1 : 0}"
        route_table_id = "${aws_route_table.public.id}"
        destination_cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
}

resource "aws_subnet" "public" {
        count = "${var.create_public_subnet ? 3 : 0}"
        tags {
                Name = "${format("Public-Subnet-%d", count.index)}"
		Tier = "Public"
        }
        vpc_id = "${aws_vpc.main.id}"
        cidr_block = "${format("%v.%v.0/24", var.cidr_address, 253 + count.index)}"
	availability_zone = "${element(concat(data.aws_availability_zones.available.names, data.aws_availability_zones.available.names, data.aws_availability_zones.available.names), count.index)}"
}

data "aws_subnet_ids" "public" {
	count = "${var.create_public_subnet ? 1 : 0}"
	vpc_id = "${aws_vpc.main.id}"
	tags {
		Tier = "Public"
	}
	depends_on = [ "aws_subnet.public" ]
}

resource "aws_route_table_association" "public_rta" {
	count = "${var.create_public_subnet ? 3 : 0}"
	subnet_id = "${element(data.aws_subnet_ids.public.ids, count.index)}"
	route_table_id = "${aws_route_table.public.id}"
}
