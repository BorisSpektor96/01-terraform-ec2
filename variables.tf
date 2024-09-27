variable "region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-0ebfd941bbafe70c6"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

# Storage Configuration 
variable "root_volume_size" {
  description = "Root volume size for the EC2 instance"
  default = 8
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volume"
  default     = 10
}

variable "ebs_volume_type" {
  description = "Type of the additional EBS volume"
  default     = "gp2"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "aws access key"
  default = "AKIAQFLZDYAS5MGAOT6N"
}
variable "AWS_SECRET_ACCESS_KEY" {
  description = "aws secret key"
  default = "uGZorr0Fvx/HigCoby/j1N4EjLko33j0CRwjgEfR"
}
