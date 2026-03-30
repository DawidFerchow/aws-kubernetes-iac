output "vpc_id" {
  description = "ID of the VPC created for the project."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the public subnets."
  value       = [for subnet in aws_subnet.public : subnet.cidr_block]
}