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

# Subnets Zone 1
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

#CLUSTER

resource "ibm_container_vpc_cluster" "cluster" {
  name               = "${var.cluster_name}"
  vpc_id             = "${ibm_is_vpc.vpc2.id}"
  flavor             = "${var.machine_type}"
  worker_count       = "${var.worker_count}"
  # resource_group_id = data.ibm_resource_group.resource_group.id

  zones {
    subnet_id = "${ibm_is_subnet.node1.id}"
    name      = "${var.zone1}"
  }
}

resource "ibm_container_vpc_worker_pool" "cluster_pool1" {
  cluster           = "${ibm_container_vpc_cluster.cluster.id}"
  worker_pool_name  = "mywp1"
  vpc_id             = "${ibm_is_vpc.vpc2.id}"
  flavor             = "${var.machine_type}"
  worker_count       = "${var.worker_count}"
  # resource_group_id = data.ibm_resource_group.resource_group.id
  zones {
    name      = "${var.zone2}"
    subnet_id = "${ibm_is_subnet.node2.id}"
  }
}

resource "ibm_container_vpc_worker_pool" "cluster_pool2" {
  cluster           = "${ibm_container_vpc_cluster.cluster.id}"
  worker_pool_name  = "mywp2"
  vpc_id             = "${ibm_is_vpc.vpc2.id}"
  flavor             = "${var.machine_type}"
  worker_count       = "${var.worker_count}"
  # resource_group_id = data.ibm_resource_group.resource_group.id
  zones {
    name      = "${var.zone3}"
    subnet_id = "${ibm_is_subnet.node3.id}"
  }
}