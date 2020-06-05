/*
  Web Servers_security_groups_public
*/
resource "aws_security_group" "sg_public" {
    name = "vpc_sg_public"
    description = "Allow 80, 443 TCP, ICMP"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["207.231.170.10/32"]
    }

    egress { # public
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow access everywhere"
    }


    vpc_id = "${aws_vpc.terraformmain.id}"

    tags {
        Name = "sg_vpc-${var.aws_resource_name}-public-web"
    }
}

/*
  Web Servers_security_groups_private internal
*/
resource "aws_security_group" "sg_private" {
    name = "vpc_sg_private"
    description = "Allow Uber internal systems"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["192.168.0.0/16"]
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["172.16.0.0/12"]
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.0.0.0/8"]
    }

    egress { # private
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow access everywhere"
    }


    vpc_id = "${aws_vpc.terraformmain.id}"

    tags {
        Name = "sg_vpc-${var.aws_resource_name}-uber-internal"
    }
}
