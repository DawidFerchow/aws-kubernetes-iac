provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "../../modules/network"

  project             = var.project_name
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  public_azs          = var.public_azs
  tags                = var.tags
}

module "security" {
  source = "../../modules/security"

  project     = var.project_name
  environment = var.environment
  vpc_id      = module.network.vpc_id
  admin_cidr  = var.admin_cidr
  tags        = var.tags
}

module "compute" {
  source = "../../modules/compute"

  project           = var.project_name
  environment       = var.environment
  ami               = var.ami_id
  instance_type     = var.instance_type
  subnet_ids        = module.network.public_subnet_ids
  security_group_id = module.security.k8s_nodes_sg_id
  key_name          = var.key_name
  worker_count      = var.worker_count
  tags              = var.tags
}