output "vpc_id" {
  description = "ID of the VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.network.public_subnet_ids
}

output "k8s_nodes_sg_id" {
  description = "Security group ID for Kubernetes nodes."
  value       = module.security.k8s_nodes_sg_id
}

output "control_plane_public_ip" {
  description = "Public IP of the control plane node."
  value       = module.compute.control_plane_public_ip
}

output "control_plane_private_ip" {
  description = "Private IP of the control plane node."
  value       = module.compute.control_plane_private_ip
}

output "worker_public_ips" {
  description = "Public IPs of worker nodes."
  value       = module.compute.worker_public_ips
}

output "worker_private_ips" {
  description = "Private IPs of worker nodes."
  value       = module.compute.worker_private_ips
}