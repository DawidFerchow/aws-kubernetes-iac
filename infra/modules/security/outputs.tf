output "k8s_nodes_sg_id" {
  description = "Security group ID for Kubernetes nodes."
  value       = aws_security_group.k8s_nodes.id
}