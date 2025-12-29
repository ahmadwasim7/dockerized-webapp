output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "ec2_instance_id" {
  value = aws_instance.app.id
}

output "ec2_public_ip" {
  value = aws_instance.app.public_ip
}
