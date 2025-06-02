provider "aws" {
  region     = var.region
}

resource "aws_instance" "app_vm" {
  ami           = var.ami
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3 git
              pip3 install flask
              cd /home/ec2-user
              git clone https://github.com/aniljeenapati/demo-repo.git
              cd demo-repo
              python3 app.py &
              EOF

  tags = {
    Name = "app-demo"
  }

  associate_public_ip_address = true
}

output "public_ip" {
  value = aws_instance.app_vm.public_ip
}
