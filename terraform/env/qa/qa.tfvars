project_id     = "playground-s-11-45901308"
region         = "us-central1"
network_name   = "qa-vpc"
instance_name = "logstash-qa"
subnet_configs = [
  {
    name        = "qa-subnet"
    region      = "us-central1"
    cidr_block  = "10.2.0.0/24"
  }
]
environment    = "qa"
enable_private_google_access = false

dev_firewall_source_ranges = ["223.185.132.225/32"]