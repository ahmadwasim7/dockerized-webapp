resource "aws_iam_policy" "ecr_push_policy" {
  name        = "github-actions-ecr-push"
  description = "Minimal permissions for GitHub Actions to push Docker images to ECR"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "ECRAuth"
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken"
        ]
        Resource = "*"
      },
      {
        Sid    = "ECRPush"
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ]
        Resource = "arn:aws:ecr:${var.aws_region}:${var.account_id}:repository/${var.ecr_repository_name}"
      }
    ]
  })
}

resource "aws_iam_policy" "ssm_send_command_policy" {
  name        = "SSMSendAndReadCommandForSpecificEC2"
  description = "Allow SSM SendCommand on a specific EC2 instance and read command execution status"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # 1️⃣ Send command to specific EC2 using RunShellScript
      {
        Sid    = "SSMSendCommand"
        Effect = "Allow"
        Action = [
          "ssm:SendCommand"
        ]
        Resource = [
          "arn:aws:ec2:us-east-1:521145340284:instance/i-087ab6e86a55bc06f",
          "arn:aws:ssm:us-east-1::document/AWS-RunShellScript"
        ]
      },

      # 2️⃣ Read command execution status & output
      {
        Sid    = "SSMReadCommandStatus"
        Effect = "Allow"
        Action = [
          "ssm:ListCommandInvocations",
          "ssm:GetCommandInvocation"
        ]
        Resource = "arn:aws:ssm:us-east-1:521145340284:*"
      }
    ]
  })
}

