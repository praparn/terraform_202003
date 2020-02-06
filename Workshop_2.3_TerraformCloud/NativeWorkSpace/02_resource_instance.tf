resource "google_compute_instance" "labserver" {
  name                    = var.compute_name
  machine_type            = var.compute_type
  zone                    = var.zone
  hostname                = var.compute_name
  boot_disk {
    initialize_params {
      image = var.image
      size = var.disk_size
    }
  }
  tags = {
    Environment = var.tag_environment
    Region      = var.tag_region
    AZ          = var.tag_az
    Categories  = var.tag_category
    Name        = var.tag_name
    Zone        = var.tag_zone
    Module      = var.tag_module
    Billing     = var.tag_billing
  }
  scratch_disk {
    interface = var.scratch_disk
  }
  network_interface {
    network = google_compute_network.lab_vpc_network.name
    access_config {
    }
  }
}
output "google_compute_instance_labserver_id" {
  google_compute_instance.labserver.instance_id
}
output "google_compute_instance_labserver_nat_ip" {
  google_compute_instance.labserver.network_interface.0.access_config.0.nat_ip
}