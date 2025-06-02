variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-00f34bf9aeacdf007"  # Amazon Linux 2 AMI (for us-east-1)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "anil-keypair"  # replace with your actual key pair name
}
