variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "aws-k8s-iac"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "public_azs" {
  type        = list(string)
  description = "Availability zones for public subnets"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
  default     = {}
}

variable "admin_cidr" {
  type        = string
  description = "CIDR block allowed to access SSH and Kubernetes API"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.small"
}

variable "key_name" {
  type        = string
  description = "AWS EC2 key pair name"
}

variable "worker_count" {
  type        = number
  description = "Number of worker nodes"
  default     = 2
}