variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0c94855ba95c71c99"  # Amazon Linux 2 AMI (for us-east-1)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}
