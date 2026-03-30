variable "project" {
  description = "Project name used for naming resources."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "ami" {
  description = "AMI ID for EC2 instances."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where instances will be deployed."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "subnet_ids must contain at least one subnet."
  }
}

variable "security_group_id" {
  description = "Security group ID to attach to instances."
  type        = string
}

variable "key_name" {
  description = "SSH key name for EC2 instances."
  type        = string
}

variable "worker_count" {
  description = "Number of worker nodes."
  type        = number
  default     = 2

  validation {
    condition     = var.worker_count >= 1
    error_message = "worker_count must be at least 1."
  }
}

variable "tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}