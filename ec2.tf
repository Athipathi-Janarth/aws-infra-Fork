# resource "aws_instance" "ec2_instance" {
#   ami                     = var.AMI_ID
#   instance_type           = "t2.micro"
#   key_name                = "ec2"
#   subnet_id               = aws_subnet.public_subnet[0].id
#   iam_instance_profile    = aws_iam_instance_profile.ec2_profile.name
#   vpc_security_group_ids  = [aws_security_group.load_balancer.id]
#   disable_api_termination = false
#   root_block_device {
#     volume_size = 50
#     volume_type = "gp2"
#   }
#   user_data = <<-EOF
#     #!/bin/bash
#     sudo echo "DB_NAME=${var.DB_NAME}" >> /home/ec2-user/webapp/.env
#     sudo echo "DB_PASSWORD=${var.DB_PASSWORD}" >> /home/ec2-user/webapp/.env
#     sudo echo "DB_PORT=${var.RDS_PORT}" >> /home/ec2-user/webapp/.env
#     sudo echo "DB_USER_NAME=${var.DB_USER}" >> /home/ec2-user/webapp/.env
#     sudo echo "DB_HOST=${aws_db_instance.rds_instance.address}" >> /home/ec2-user/webapp/.env
#     sudo echo "AWS_BUCKET_NAME=${aws_s3_bucket.bucket.bucket}" >> /home/ec2-user/webapp/.env
#     sudo echo "AWS_BUCKET_REGION=${var.AWS_REGION}" >> /home/ec2-user/webapp/.env
#     sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/home/ec2-user/webapp/AmazonCloudWatchConfig.json -s
#     EOF
#   tags = {
#     Name = var.EC2_NAME
#   }
#   lifecycle {
#     prevent_destroy = false
#   }

# }