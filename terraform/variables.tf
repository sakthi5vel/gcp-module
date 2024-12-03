# The GCP project ID
variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

# The region where resources will be deployed
variable "region" {
  description = "The region for the resources."
  type        = string
}

# The name of the VPC network
variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}

# Subnet configuration for each environment (dev, prod, etc.)
variable "subnet_configs" {
  description = "List of subnet configurations, each containing a name, region, and CIDR block."
  type = list(object({
    name       = string
    region     = string
    cidr_block = string
  }))
}

# The environment for this configuration (e.g., dev, prod, qa)
variable "environment" {
  description = "The environment for the configuration (dev, prod, qa, etc.)."
  type        = string
}

# Whether to enable private Google access on subnets (optional)
variable "enable_private_google_access" {
  description = "Whether to enable private Google access on subnets."
  type        = bool
  default     = false
}

# Firewall rules for production environment (IP ranges)
variable "prod_firewall_source_ranges" {
  description = "Source IP ranges for the prod firewall rule."
  type        = list(string)
  default     = ["0.0.0.0/0"] # Example: Allow from anywhere in prod
}

# Firewall rules for dev environment (specific IP ranges)
variable "dev_firewall_source_ranges" {
  description = "Source IP ranges for the dev firewall rule."
  type        = list(string)
  default     = ["122.171.18.137/32"] # Example: Specific IP for dev environment
}

# Name of the compute instance
variable "instance_name" {
  description = "The name of the compute instance."
  type        = string
}


# The image to use for the instance's boot disk
variable "image" {
  description = "The image to use for the compute instance."
  type        = string
  default     = "ubuntu-2004-focal-v20241115"
}


# Tags to apply to the compute instance
variable "instance_tags" {
  description = "Tags to apply to the compute instance."
  type        = list(string)
  default     = []
}