# Terraform Multi-Environment Infrastructure

This repository contains a modular Terraform configuration for deploying AWS infrastructure across three environments: **dev**, **preprod**, and **prod**.

## Project Structure

Each environment is isolated with its own configuration and variables.

## Quick Start

1. Navigate to desired environment:
```bash
cd environments/dev
```

2. Initialize Terraform:
```bash
terraform init
```

3. Plan and apply:
```bash
terraform plan
terraform apply
```

## Modules

- **VPC**: Creates networking infrastructure with public/private subnets
- **Security**: Manages security groups and ingress/egress rules
- **EC2**: Launches instances with Nginx web server

## Configuration

Edit `terraform.tfvars` in each environment folder to customize your deployment.
