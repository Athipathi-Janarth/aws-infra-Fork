resource "aws_kms_key" "ec2_encryption" {
  description             = "EC2 encryption key"
  deletion_window_in_days = 15
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey",
          "kms:ScheduleKeyDeletion"
        ]
        Resource = "*"
      },
      {
        Sid       = "Allow key owner to update key policy"
        Effect    = "Allow"
        Principal = {
          AWS = "*"
        }
        Action    = [
          "kms:PutKeyPolicy",
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:ScheduleKeyDeletion"
        ]
        Resource  = "*"
      }
    ]
  })
  tags = {
    "Name" = "ec2-encryption"
  }
}

resource "aws_kms_key" "rds_encryption" {
  description             = "RDS encryption key"
  deletion_window_in_days = 15
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey",
          "kms:ScheduleKeyDeletion"
        ]
        Resource = "*"
      },
      {
        Sid       = "Allow key owner to update key policy"
        Effect    = "Allow"
        Principal = {
          AWS = "*"
        }
        Action    = [
          "kms:PutKeyPolicy",
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:ScheduleKeyDeletion"
        ]
        Resource  = "*"
      }
    ]
  })
  tags = {
    "Name" = "rds-encryption"
  }
}