variable "region" {
  default = "eu-north-1"
}

variable "ami" {
  default = "ami-04f6b953f2c230568"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "anil-keypair"  # replace with your actual key pair name
}
