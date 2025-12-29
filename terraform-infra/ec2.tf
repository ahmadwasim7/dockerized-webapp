data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name             = var.key_name

  associate_public_ip_address = true

    vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  tags = {
    Name = "dockerized-webapp-ec2"
  }
}
