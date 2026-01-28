# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  vpc_name               = var.project_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidr     = var.public_subnet_cidr
  private_subnet_cidr    = var.private_subnet_cidr
  environment            = var.environment
  aws_region             = var.aws_region
}

# Security Group Module
module "security_group" {
  source = "../../modules/security"

  security_group_name = "${var.project_name}-web"
  vpc_id              = module.vpc.vpc_id
  environment         = var.environment
  ssh_cidr            = var.ssh_cidr
  http_enabled        = true
  https_enabled       = true
}

# Nginx User Data Script
locals {
  user_data_script = file("${path.module}/../../scripts/nginx_install.sh")
}

# EC2 Module
module "ec2_instance" {
  source = "../../modules/ec2"

  instance_name         = "${var.project_name}-web-server"
  instance_type         = var.instance_type
  subnet_id             = module.vpc.public_subnet_id
  security_group_ids    = [module.security_group.security_group_id]
  key_pair_name         = var.key_pair_name
  environment           = var.environment
  user_data_script      = local.user_data_script
  enable_monitoring     = var.enable_monitoring
  root_volume_size      = var.root_volume_size

  tags = {
    Project = var.project_name
    ManagedBy = "Terraform"
  }
}
