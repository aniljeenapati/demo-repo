variable "region" {
  default = "eu-north-1"
}

variable "ami" {
  default = "ami-0c1ac8a41498c1a9c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "anil-keypair"  # replace with your actual key pair name
}
