# Declare the data source
data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORG , IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
   vpc_id = "${aws_vpc.terraformmain.id}"
    tags {
        Name = "vpc-${var.aws_resource_name}-prod-igw"
    }
}
resource "aws_network_acl" "all" {
   vpc_id = "${aws_vpc.terraformmain.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "vpc-${var.aws_resource_name}-prod-nacl"
    }
}
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = "vpc-${var.aws_resource_name}-prod-pub"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

resource "aws_vpn_gateway_route_propagation" "Route_Propagation_Public" {
  vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = "vpc-${var.aws_resource_name}-prod-pri"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.PublicAZA.id}"
  }
}

resource "aws_vpn_gateway_route_propagation" "Route_Propagation_Private" {
  vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_eip" "forNat" {
    vpc      = true

    tags {
   Name = "vpc-${var.aws_resource_name}-nat-eip"
 }
}
resource "aws_nat_gateway" "PublicAZA" {
    allocation_id = "${aws_eip.forNat.id}"
    subnet_id = "${aws_subnet.PublicAZA.id}"
    depends_on = ["aws_internet_gateway.gw"]
tags {
        Name = "vpc-${var.aws_resource_name}-prod-nat"
}
}
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${aws_vpc.terraformmain.id}"

  tags {
    Name = "vpc-${var.aws_resource_name}-prod-vpg"
  }
}
