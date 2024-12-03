project_id     = "playground-s-11-45901308"
region         = "us-central1"
network_name   = "prod-vpc"
instance_name = "logstash-prod"
subnet_configs = [
  {
    name        = "prod-subnet"
    region      = "us-central1"
    cidr_block  = "10.1.0.0/24"
  }
]
environment    = "prod"
enable_private_google_access = true

prod_firewall_source_ranges = ["10.0.0.0/24"]
