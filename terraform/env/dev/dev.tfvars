project_id     = "playground-s-11-45901308"
region         = "us-central1"
network_name   = "dev-vpc"
instance_name = "logstash-dev"
subnet_configs = [
  {
    name        = "dev-subnet"
    region      = "us-central1"
    cidr_block  = "10.0.0.0/24"
  }
]
environment    = "dev"
enable_private_google_access = false

dev_firewall_source_ranges = ["223.185.132.225/32"]