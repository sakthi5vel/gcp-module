resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.environment == "prod" ? "e2-medium" : "e2-small"
  zone         = "${var.region}-a"
  
  # Boot disk configuration
  boot_disk {
    initialize_params {
      image = var.image != "" ? var.image : "ubuntu-2004-focal-v20241115"  # Default image if not provided
    }
  }

  # Network interface configuration
  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id
    #access_config {}  
  }

  # Metadata to tag the instance with environment details
  metadata = {
    environment = var.environment
  }

  tags = var.instance_tags 
}