provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "app_vm" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

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
    Name = "flask-demo"
  }

  associate_public_ip_address = true
}

output "public_ip" {
  value = aws_instance.flask_vm.public_ip
}
