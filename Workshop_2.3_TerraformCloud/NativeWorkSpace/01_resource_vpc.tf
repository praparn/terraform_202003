resource "google_compute_network" "lab_vpc_network" {
  name                    = var.gcompute_network_name
  auto_create_subnetworks = var.gcompute_createsubnet
}

resource "google_compute_firewall" "lab_firewall" {
  name    = "allow-ssh"
  network = google_compute_network.lab_vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.compute]
}