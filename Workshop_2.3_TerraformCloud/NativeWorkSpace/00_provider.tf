provider "google" {
  credentials = file("~/account.json")
  project     = var.projectname
  region      = var.region
  zone        = var.zone
}