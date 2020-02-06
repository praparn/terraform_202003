resource "google_compute_network" "lab_vpc_network" {
  name                    = var.gcompute_network_name
  auto_create_subnetworks = var.gcompute_createsubnet
}