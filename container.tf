resource "oci_containerengine_node_pool" "nginx_pool" {
  compartment_id      = "YOUR_COMPARTMENT_OCID"
  kubernetes_cluster_id = "YOUR_CLUSTER_OCID"
  name                = "nginx-pool"
  node_image_name     = "Oracle-Linux-7.9"
  node_shape          = "VM.Standard2.1"
  subnet_ids          = [oci_core_subnet.public_subnet[0].id]
}

resource "oci_containerengine_node_pool" "nginx_pool_private" {
  compartment_id      = "YOUR_COMPARTMENT_OCID"
  kubernetes_cluster_id = "YOUR_CLUSTER_OCID"
  name                = "nginx-pool-private"
  node_image_name     = "Oracle-Linux-7.9"
  node_shape          = "VM.Standard2.1"
  subnet_ids          = [oci_core_subnet.private_subnet[0].id]
}

resource "oci_containerengine_node_pool_node" "nginx_instances" {
  count = 2

  node_pool_id = oci_containerengine_node_pool.nginx_pool.id

  # Customize the node options as needed
  node_options {
    name        = "nginx-${count.index + 1}"
    kubernetes_version = "YOUR_K8S_VERSION"
  }
}
