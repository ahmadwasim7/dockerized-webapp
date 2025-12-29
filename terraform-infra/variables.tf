variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket for Terraform remote state"
  type        = string
  default = "my-terraform-ci-state"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for state locking"
  type        = string
  default = "terraform-locks"
}

variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name"
  default     = "dockerized-webapp"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Optional EC2 key pair name (for emergency access)"
  default     = "my_key_pair_usa"
}
