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
variable "cluster_zones" {
  description = "List maps containing a zone number and the id of a subnet in that zone. Can be used to create a cluster on any number of subnets in a single region"
  type        = "list"
    /*
   example =[
    {
      zone     = 1
      subnet_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    },
    {
      zone     = 2
      subnet_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    },
    {
      zone     = 3
      subnet_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    }
  ]
  */
}
variable "machine_type" {
  description = "Machine type for the IKS Cluster"
  default     = "b2.4x16"
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

