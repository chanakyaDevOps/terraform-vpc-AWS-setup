## AWS_VPC_Terraform ()
This module will built complete VPC STACK (subnets, Route Tables, DHCP, Internet gateway, NAT, network ACLs, Security groups, Virtual Private Gateway and Elastic IPs) for AWS Region.

### Getting started
It does not really matter if all scripts are contained in a single main file or divided into many individual resources files.
Any how terraform guides to maintain all this resource files into multiple as a best practice.

### Prerequisites
install terraform on vm where you will perform this actions

### AWS_VPC_Terraform files structure
`terraform.tsvars` This vars file can be maintained internally

`variables-vpc.tf` All variables are maintained in variables-vpc.tf, every variable is a
string except vpc_domain_name_servers and vpc_ntp_servers these are array list.

Resources will be created based on the defined variable values, Easy to launch a new VPC stack
in any region just with updating variable values in the file.  

`dns-dhcp-vpc.tf` This file will create dhcp set with domain_name, domain_name_servers and
ntp_server associated with created VPN, Route53 DNS can also be created if its a brand new AWS Account.

`network-vpc.tf` In the network-vpc.tf file we will declare the service provider configuration,
in this case its AWS we specify keys and region here with VPC custom setup based on variable values declared in varaibles-vpc.tf file.

`routing-network-vpc.tf` We declare internet_gateway, network_acl, associated
route_tables (public & private), NAT setup and vpn_gateway in this file.

`security-group.tf` We are creating two security groups sg_vpc-aps1-public-web and
sg_vpc-aps1-public-web with inbound/outbound rules tied to VPC.

`subnets-vpc.tf` There are 4 subnets being created using this file, 2 private 2 public based on AWS Region and availability_zones. Should be modified as per AWS regions availability_zones.

All files should be maintained with extension `*.tf` This gives us a handy way to break the configuration into sections.
except terraform.tsvars file (puppet maintained for keys)  

replace the variables values in `variables-vpc.tf` for different regions.

#### steps to launch & run stack:
`terraform init` in case of any updated
terraform validate to check for errors in `*.tf` files in directory.

`terraform plan -out nameyourapp.tff`
`terraform apply nameyourapp.tff`

#### update the stack:
update the file as needed and plan and apply it updates the STACK

`terraform destroy` will delete the complete STACK make sure you run this commands in the directory.

`.tfstate` and `.tfstate.backup` holds the last-known state of the infrastructure.
