output "publicip" {
  description = "print public ip"
  value       = aws_instance.dev.public_ip
}
output "privateip" {
  description = "print private ip"
  value       = aws_instance.dev.private_ip
  sensitive   = true
}