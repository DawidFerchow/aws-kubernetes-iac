resource "aws_instance" "control_plane" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = merge(var.tags, {
    Name = "${var.project}-${var.environment}-control-plane"
    Role = "control-plane"
  })
}

resource "aws_instance" "workers" {
  count                  = var.worker_count
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = merge(var.tags, {
    Name = "${var.project}-${var.environment}-worker-${count.index + 1}"
    Role = "worker"
  })
}