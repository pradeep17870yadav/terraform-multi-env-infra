variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "user_data_script" {
  description = "User data script to run on instance launch"
  type        = string
}

variable "enable_monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "Size of root EBS volume in GB"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Type of root EBS volume"
  type        = string
  default     = "gp3"
}

variable "tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {}
}
