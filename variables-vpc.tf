variable "aws_region" {
  default = "ap-south-1"
}
variable "aws_resource_name" {
  default = "aps1"
  description = "aws resource naming"
}
variable "aws_access_key" {
  default = ""
  description = "aws access key"
}
variable "aws_secret_key" {
 default = ""
  description = "aws secret key"
}
variable "vpc_name" {
   default = "vpc-aps1-prod"
   description = "vpc name of the stack"
}
variable "vpc_full_cidr" {
    default = "172.31.208.0/23"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "172.31.208.0/25"
  description = "the cidr of the Public-AzA-subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "172.31.208.128/25"
  description = "the cidr of the Private-AzA-subnet"
}
variable "Subnet-Public-AzB-CIDR" {
  default = "172.31.209.0/25"
  description = "the cidr of the Public-AzB-subnet"
}
variable "Subnet-Private-AzB-CIDR" {
  default = "172.31.209.128/25"
  description = "the cidr of the Private-AzB-subnet"
}
variable "DnsZoneName" {
  default = "corp.uber.internal"
  description = "corp internal dns name"
}
variable "vpc_dhcp_name" {
  default = "dhcp-aps1-corp.uber.internal"
  description = "vpc dhcp name"
}
variable "vpc_domain_name_servers" {
  default = ["192.168.255.20"]
  description = "value for dhcp domain_name_servers"
}
variable "vpc_ntp_servers" {
  default = ["192.168.255.21"]
  description = "value for dhcp ntp_servers"
}
