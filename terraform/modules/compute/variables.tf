variable "instance_name" {
  description = "The name of the compute instance."
  type        = string
}

variable "region" {
  description = "The region where the compute instance will be deployed."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC network to which the instance will be attached."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the instance will be attached."
  type        = string
}

variable "environment" {
  description = "The environment for the configuration (dev, prod, qa, etc.)."
  type        = string
}

variable "image" {
  description = "The image to use for the instance's boot disk (optional)."
  type        = string
  default     = "debian-11-bullseye-v20230523"
}

variable "instance_tags" {
  description = "List of tags to apply to the instance (optional)."
  type        = list(string)
  default     = []
}