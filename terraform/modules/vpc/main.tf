resource "google_compute_network" "vpc" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

# Subnet Creation
resource "google_compute_subnetwork" "subnet" {
  count = length(var.subnet_configs)
  name  = var.subnet_configs[count.index].name
  region = var.subnet_configs[count.index].region
  network = google_compute_network.vpc.id
  ip_cidr_range = var.subnet_configs[count.index].cidr_block
  private_ip_google_access = var.enable_private_google_access
}

# Firewall Rule for Prod environment
resource "google_compute_firewall" "allow_all" {
  count    = var.environment == "prod" ? 1 : 0  
  name     = "allow-all"
  network  = google_compute_network.vpc.id
  direction = "INGRESS"
  priority = 1000
  source_ranges = var.prod_firewall_source_ranges
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  target_tags = ["allow-all"]
}

# Firewall Rule for Dev environment (allow SSH and RDP)
resource "google_compute_firewall" "allow_ssh_rdp" {
  count    = var.environment == "dev" ? 1 : 0  
  name     = "allow-ssh-rdp"
  network  = google_compute_network.vpc.id
  direction = "INGRESS"
  priority = 1000
  source_ranges = var.dev_firewall_source_ranges  

  # Allow SSH and RDP ports
  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]  
  }

  target_tags = ["allow-ssh-rdp"]
}
