provider "google" {
  credentials = "key.json"
  project = var.project_id
  region  = var.region
}

# VPC Module: Create a VPC and Subnets
module "vpc" {
  source                       = "./modules/vpc"
  project_id                   = var.project_id
  region                       = var.region
  network_name                 = var.network_name
  subnet_configs               = var.subnet_configs
  environment                  = var.environment
  enable_private_google_access = var.enable_private_google_access
  prod_firewall_source_ranges  = var.prod_firewall_source_ranges
  dev_firewall_source_ranges   = var.dev_firewall_source_ranges
}

# Compute Module: Create Compute Instances
module "compute" {
  source        = "./modules/compute"
  region        = var.region
  vpc_id        = module.vpc.vpc_network_id
  subnet_id     = module.vpc.subnet_ids[0] # Assuming first subnet; can be customized for multi-subnet.
  instance_name = var.instance_name
  environment   = var.environment
  image         = var.image
  instance_tags = var.instance_tags
}