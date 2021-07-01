resource "google_compute_instance" "default" {
  for_each = toset( var.serverList )
  name     = "${var.experimentName}-${each.key}"
  machine_type = var.machineType
  zone         = var.zone
  
  metadata_startup_script = templatefile("./kuma-startup.sh", { kuma-version = var.consulVersion, server = each.key, zone = var.zone })
  tags = var.networkTags

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = "default"

    access_config {
    }
  }
}
