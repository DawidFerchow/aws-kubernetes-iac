variable "project" {
  description = "Project name used for tags/naming."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Exactly two CIDR blocks for public subnets (one per availability zone)."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "public_subnet_cidrs must contain exactly 2 CIDR blocks."
  }

  validation {
    condition = alltrue([
      for c in var.public_subnet_cidrs : can(cidrnetmask(c))
    ])
    error_message = "Each entry in public_subnet_cidrs must be a valid CIDR block."
  }
}

variable "public_azs" {
  description = "Exactly two availability zones (one per public subnet)."
  type        = list(string)

  validation {
    condition     = length(var.public_azs) == 2
    error_message = "public_azs must contain exactly 2 availability zones."
  }

  validation {
    condition = alltrue([
      for az in var.public_azs : length(trimspace(az)) > 0
    ])
    error_message = "Each entry in public_azs must be a non-empty string."
  }
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}