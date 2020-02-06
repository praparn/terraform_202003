provider "google" {
  credentials = "${file("~/account.json")}"
  project     = "my-project-id"
  region      = "us-central1"
  zone        = "us-central1-c"
}