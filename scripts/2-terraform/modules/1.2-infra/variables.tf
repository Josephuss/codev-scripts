variable "region" {
  description = "The AWS region to deploy in"
  default     = "us-west-2"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"  # test
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  default     = "t2.micro"
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume in GB"
  default     = 50
}

variable "availability_zone" {
  description = "The availability zone for the EC2 instance and the EBS volume"
  default     = "us-west-2"
}