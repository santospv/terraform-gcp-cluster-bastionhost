resource "google_compute_address" "static" {
  name = "ipv4-address"
}
resource "google_compute_instance" "bastion_host" {
  name = sensitive("${var.project_id}-bastion")
  project = var.project_id
  machine_type = "e2-medium"
  zone = var.zone
  tags = ["gce", sensitive("${var.project_id}-bastion")]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = "15"
    }
  }

  network_interface {
    network    = "default"
    # subnetwork = google_compute_subnetwork.subnet.name
    access_config {
    }
  }
}