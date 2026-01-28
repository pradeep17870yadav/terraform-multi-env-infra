variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR block allowed for SSH"
  type        = string
}

variable "http_enabled" {
  description = "Enable HTTP access"
  type        = bool
  default     = true
}

variable "https_enabled" {
  description = "Enable HTTPS access"
  type        = bool
  default     = true
}
