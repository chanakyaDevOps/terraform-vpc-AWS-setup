provider "aws" {
 access_key = "${var.aws_access_key}"
 secret_key = "${var.aws_secret_key}"
 region = "${var.aws_region}"
}

resource "aws_vpc" "terraformmain" {
    cidr_block = "${var.vpc_full_cidr}"
   #### this 2 true values are for use the internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "${var.vpc_name}"
    }
}
