resource "aws_iam_policy" "ec2_webapp_s3" {
  name        = "WebAppS3"
  description = "EC2 S3 access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListObject",
          "s3:DeleteObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
        ]
      }
    ]
  })
}
resource "aws_iam_role" "ec2_user" {
  name        = "EC2-CSYE6225"
  description = "EC2 IAM role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "CloudWatchAgentServerPolicy_attachment" {
  role       = aws_iam_role.ec2_user.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}
resource "aws_iam_role_policy_attachment" "EC2_S3_role_attachment" {
  role       = aws_iam_role.ec2_user.name
  policy_arn = aws_iam_policy.ec2_webapp_s3.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_user.name
}
