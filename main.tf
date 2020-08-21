resource "ibm_is_ssh_key" "vpc-iks" {
  name       = "vpc-iks"
  public_key = "${var.ssh_public_key}"
}
# Create VPC
resource "ibm_is_vpc" "vpc2" {
  name = "${var.vpc_name}"
  # resource_group  = "${data.ibm_resource_group.resource_group.id}"
}
# VPC Zones
resource "ibm_is_vpc_address_prefix" "vpc-ap1" {
  name = "vpc-ap1"
  zone = "${var.zone1}"
  vpc  = "${ibm_is_vpc.vpc2.id}"
  cidr = "${var.zone1_cidr}"
}

resource "ibm_is_vpc_address_prefix" "vpc-ap2" {
  name = "vpc-ap2"
  zone = "${var.zone2}"
  vpc  = "${ibm_is_vpc.vpc2.id}"
  cidr = "${var.zone2_cidr}"
}

resource "ibm_is_vpc_address_prefix" "vpc-ap3" {
  name = "vpc-ap3"
  zone = "${var.zone3}"
  vpc  = "${ibm_is_vpc.vpc2.id}"
  cidr = "${var.zone3_cidr}"
}

# Subnets 
resource "ibm_is_subnet" "node1" {
  name            = "node1"
  vpc             = "${ibm_is_vpc.vpc2.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "${var.zone1_cidr}"
  depends_on      = ["ibm_is_vpc_address_prefix.vpc-ap1"]
}

resource "ibm_is_subnet" "node2" {
  name            = "node2"
  vpc             = "${ibm_is_vpc.vpc2.id}"
  zone            = "${var.zone2}"
  ipv4_cidr_block = "${var.zone2_cidr}"
  depends_on      = ["ibm_is_vpc_address_prefix.vpc-ap2"]
}

resource "ibm_is_subnet" "node3" {
  name            = "node3"
  vpc             = "${ibm_is_vpc.vpc2.id}"
  zone            = "${var.zone3}"
  ipv4_cidr_block = "${var.zone3_cidr}"
  depends_on      = ["ibm_is_vpc_address_prefix.vpc-ap3"]
}

variable "cluster_zones" {
  depends_on      = ["ibm_is_subnet.node1","ibm_is_subnet.node2","ibm_is_subnet.node3"]
  description = "List maps containing a zone number and the id of a subnet in that zone. Can be used to create a cluster on any number of subnets in a single region"
  type        = "list"
    
   example =[
    {
      zone     = 1
      subnet_id = "${ibm_is_subnet.node1.id}"
    },
    {
      zone     = 2
      subnet_id = "${ibm_is_subnet.node2.id}"
    },
    {
      zone     = 3
      subnet_id = "${ibm_is_subnet.node3.id}"
    }
  ]
  
}