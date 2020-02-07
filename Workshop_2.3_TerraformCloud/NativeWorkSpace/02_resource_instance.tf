resource "google_compute_instance" "labserver" {
  name                    = var.compute
  machine_type            = var.compute_type
  zone                    = var.zone
  hostname                = var.compute_name
   tags                   = [var.compute]
  can_ip_forward          = true
  boot_disk {
    initialize_params {
      image = var.image
      size = var.disk_size
    }
  }

  network_interface {
    network = google_compute_network.lab_vpc_network.name
    access_config {
    }
  }
  metadata_startup_script = var.user_data
  metadata = {
   ssh-keys = "ubuntu:${file("~/terraform_gcloud.pub")}"
 }
}
output "google_compute_instance_labserver_id" {
  value = google_compute_instance.labserver.instance_id
}
output "google_compute_instance_labserver_nat_ip" {
  value = google_compute_instance.labserver.network_interface.0.access_config.0.nat_ip
}