resource "aws_security_group" "k8s_nodes" {
  name        = "${var.project}-${var.environment}-k8s-nodes-sg"
  description = "Security group for Kubernetes control plane and worker nodes"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.project}-${var.environment}-k8s-nodes-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "ssh_from_admin" {
  security_group_id = aws_security_group.k8s_nodes.id
  description       = "SSH access from admin IP"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.admin_cidr
}

resource "aws_vpc_security_group_ingress_rule" "k8s_api_from_admin" {
  security_group_id = aws_security_group.k8s_nodes.id
  description       = "Kubernetes API access from admin IP"
  from_port         = 6443
  to_port           = 6443
  ip_protocol       = "tcp"
  cidr_ipv4         = var.admin_cidr
}

resource "aws_vpc_security_group_ingress_rule" "all_from_same_sg" {
  security_group_id            = aws_security_group.k8s_nodes.id
  description                  = "Allow all traffic between cluster nodes"
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.k8s_nodes.id
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.k8s_nodes.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}