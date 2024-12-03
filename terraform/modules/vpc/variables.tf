variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the VPC and subnet."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "subnet_configs" {
  description = "List of subnet configurations, each containing a name, region, and CIDR block."
  type = list(object({
    name        = string
    region      = string
    cidr_block  = string
  }))
}

variable "environment" {
  description = "The environment for the configuration (dev, prod, qa, staging)."
  type        = string
}

variable "enable_private_google_access" {
  description = "Whether to enable private Google access on subnets."
  type        = bool
  default     = false
}

variable "prod_firewall_source_ranges" {
  description = "The source IP ranges allowed for prod firewall rule."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "dev_firewall_source_ranges" {
  description = "The source IP ranges allowed for dev firewall rule."
  type        = list(string)
  default     = ["223.185.132.225/32"]
}
