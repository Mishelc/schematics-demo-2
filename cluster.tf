##############################################################################
# Create IKS on VPC Cluster
##############################################################################

/*
resource "ibm_container_vpc_cluster cluster" {

  name               = "${var.cluster_name}"
  vpc_id             = "${data.ibm_is_vpc.vpc.id}"
  flavor             = "${var.machine_type}"
  worker_count       = "${var.worker_count}"
  # resource_group_id  = "${data.ibm_resource_group.resource_group.id}"

  dynamic zones {
    for_each = "${var.cluster_zones}"
    content {
      subnet_id = "${zones.value.subnet_id}"
      name      = "${var.ibm_region}-${zones.value.zone}"
    }
  }

  disable_public_service_endpoint = "${var.disable_pse}"
}

*/
