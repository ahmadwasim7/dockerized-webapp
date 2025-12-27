variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
  default = "521145340284"
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
  default = "dockerized-webapp"
}

variable "github_org" {
  type        = string
  default = "ahmadwasim7"
}

variable "github_repo" {
  type        = string
  default = "dockerized-webapp"
}

variable "github_branch" {
  type        = string
  default = "master"
}