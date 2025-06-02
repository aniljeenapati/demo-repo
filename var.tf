variable "region" {
  default = "eu-north-1"
}

variable "ami" {
  default = "ami-00f34bf9aeacdf007"  # Amazon Linux 2 AMI (for us-east-1)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}
