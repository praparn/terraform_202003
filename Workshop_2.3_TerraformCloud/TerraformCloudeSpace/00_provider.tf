provider "google" {
  credentials = file("GCloud-Lab_Credential.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}