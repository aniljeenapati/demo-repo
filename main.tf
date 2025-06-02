provider "aws" {
  region = var.region
}

resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow inbound traffic for Flask app"
  vpc_id      = "vpc-067780b27f22731cb"

  ingress {
    description      = "Allow Flask app traffic"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  # open to the world (for testing)
  }

  # Optional: allow SSH
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["205.254.168.186/32"] # restrict to your IP
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}

resource "aws_instance" "app_vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3 git
              pip3 install flask
              cd /home/ec2-user
              git clone https://github.com/aniljeenapati/demo-repo.git
              cd demo-repo
              nohup python3 app.py &
              EOF

  tags = {
    Name = "app-demo"
  }
}
