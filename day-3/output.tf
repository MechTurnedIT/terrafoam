output "publicip" {
  description = "print public ip of public ec2"
  value       = aws_instance.devpub.public_ip
}

output "privateip" {
  description = "print private ip of private ec2"
  value       = aws_instance.devpvt.private_ip
  sensitive   = true
}