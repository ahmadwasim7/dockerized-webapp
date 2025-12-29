data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "app_sg" {
  name        = "dockerized-webapp-sg"
  description = "Allow inbound access to Dockerized Web App"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow app traffic on port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OPTIONAL: SSH (only if you still want emergency access)
  ingress {
    description = "Allow SSH (optional)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dockerized-webapp-sg"
  }
}
