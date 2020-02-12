provider "google" {
  credentials = file("GCloud-Credential.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}