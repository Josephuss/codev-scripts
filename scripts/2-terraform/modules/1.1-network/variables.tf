variable "region" {
  description = "The AWS region to deploy in"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "The CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "security_group_name" {
  description = "The name of the security group"
  default     = "codev-sg"
}

variable "allowed_ssh_cidr" {
  description = "The CIDR block that is allowed to access SSH"
  default     = "0.0.0.0/0"
}

variable "allowed_http_cidr" {
  description = "The CIDR block that is allowed to access HTTP"
  default     = "0.0.0.0/0"
}
