project_id     = "playground-s-11-45901308"
region         = "us-central1"
network_name   = "staging-vpc"
instance_name = "logstash-staging"
subnet_configs = [
  {
    name        = "staging-subnet"
    region      = "us-central1"
    cidr_block  = "10.3.0.0/24"
  }
]
environment    = "staging"
enable_private_google_access = false

dev_firewall_source_ranges = ["223.185.132.225/32"]