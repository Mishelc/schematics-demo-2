/*
variable "resource_group" {
  default = "VPC"
  description = "Name of resource group to provision resources"
}
*/

variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-south"
}
##############################################################################
# VPC Variables
##############################################################################
variable "vpc_name" {
  default = "vpc-demo-2"
  description = "Name of your VPC"
}

variable "zone1" {
  default = "us-south-1"
  description = "Define the 1st zone of the region"
}

variable "zone2" {
  default = "us-south-2"
  description = "Define the 2nd zone of the region"
}

variable "zone3" {
  default = "us-south-3"
  description = "Define the 3nd zone of the region"
}

variable "zone1_cidr" {
  default = "192.168.1.0/24"
  description = "CIDR block to be used for zone 1"
}

variable "zone2_cidr" {
  default = "192.168.2.0/24"
  description = "CIDR block to be used for zone 2"
}

variable "zone3_cidr" {
  default = "192.168.3.0/24"
  description = "CIDR block to be used for zone 3"
}

##############################################################################
# Cluster Variables
##############################################################################

variable "cluster_name" {
  description = "name for the iks cluster"
  default     = "iks-on-vpc-cluter"
}

variable "machine_type" {
  description = "Machine type for the IKS Cluster"
  default     = "b3c.4x16"
}


variable "worker_count" {
  description = "Number of workers per zone"
  default     = 1
}

variable "disable_pse" {
  description = "Disable public service endpoint for cluster. True or false"
  default     = false
}

variable "enable_albs" {
  description = "Enable ALBs for cluster"
  default     = true
}

variable "only_private_albs" {
  description = "enable only private albs"
  default     = false
}

/*
variable "ssh_public_key" {
  default = "AAAAB3NzaC1yc2EAAAABJQAAAQEAmuhJuR9by62GlICEhd5wireNcTQVpyXvD6TPxg87X9oDvgzK/0v5PzQs4yc3nNWRfSkbo9KFX1ML/8jmrO6M8yYiKN2RYKWGua0CHDNphYxqE9EfnK6NiJ8k/20ZikH6b0KbRi3e7FYRqF8qjD9NPZroRZwlNnP7HJbvhBlyB67tWyvFWdSUrqoxlEqVu+NPGTHTXStyZxkWPEzyqvCMWpA026o/jV6REptIOtJ2yeshQM/oSXrVa6Yr/t+gV5hsqVsy4sM3U3JuGS+UGWnQj9L3HrDc4FhFugaSne6jSV32ObkHLqmHRVvi/SsJlzz5JFfO8WnQoxab0hdfq7W+RQ=="
  description = "SSH Public Key contents to be used"
}
*/