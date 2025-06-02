output "flask_vm_ip" {
  value = aws_instance.app_vm.public_ip
}
