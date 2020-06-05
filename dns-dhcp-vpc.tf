resource "aws_vpc_dhcp_options" "vpc_dhcp" {
    domain_name = "${var.DnsZoneName}"
    domain_name_servers  = "${var.vpc_domain_name_servers}"
    ntp_servers          = "${var.vpc_ntp_servers}"
    tags {
      Name = "${var.vpc_dhcp_name}"
    }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
    vpc_id = "${aws_vpc.terraformmain.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.vpc_dhcp.id}"
}

/* DNS PART ZONE AND RECORDS */
#resource "aws_route53_zone" "main" {
 # name = "${var.DnsZoneName}"
  #vpc_id = "${aws_vpc.terraformmain.id}"
  #comment = "Managed by crop-platform"
#}
