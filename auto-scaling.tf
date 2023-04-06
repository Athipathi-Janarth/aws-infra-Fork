resource "aws_launch_configuration" "asg_launch_config" {
  image_id                    = var.AMI_ID
  instance_type               = "t2.micro"
  key_name                    = "ec2"
  associate_public_ip_address = true
  user_data                   = <<-EOF
    #!/bin/bash
    sudo echo "DB_NAME=${var.DB_NAME}" >> /home/ec2-user/webapp/.env
    sudo echo "DB_PASSWORD=${var.DB_PASSWORD}" >> /home/ec2-user/webapp/.env
    sudo echo "DB_PORT=${var.RDS_PORT}" >> /home/ec2-user/webapp/.env
    sudo echo "DB_USER_NAME=${var.DB_USER}" >> /home/ec2-user/webapp/.env
    sudo echo "DB_HOST=${aws_db_instance.rds_instance.address}" >> /home/ec2-user/webapp/.env
    sudo echo "AWS_BUCKET_NAME=${aws_s3_bucket.bucket.bucket}" >> /home/ec2-user/webapp/.env
    sudo echo "AWS_BUCKET_REGION=${var.AWS_REGION}" >> /home/ec2-user/webapp/.env
    sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/home/ec2-user/webapp/AmazonCloudWatchConfig.json -s
    EOF
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  security_groups             = [aws_security_group.application.id]
}


resource "aws_autoscaling_group" "application" {
  name                 = "Application auto-scaling"
  default_cooldown     = 60
  vpc_zone_identifier  = [for subnet in aws_subnet.public_subnet : subnet.id]
  launch_configuration = aws_launch_configuration.asg_launch_config.name
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1

  tag {
    key                 = "ec2"
    value               = "webapp-instance"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_up_policy" {
  name                   = "cpu-scale-up-policy"
  autoscaling_group_name = aws_autoscaling_group.application.name
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  scaling_adjustment = 1
  cooldown = 60
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name = "scale-up-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 300
  statistic = "Average"
  threshold = 5
  alarm_description = "Alarm for scale up"
  alarm_actions = [aws_autoscaling_policy.scale_up_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.application.name
  }
}

resource "aws_autoscaling_policy" "scale_down_policy" {
  name                   = "cpu-scale-down-policy"
  autoscaling_group_name = aws_autoscaling_group.application.name
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  scaling_adjustment = -1
  cooldown = 60
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name = "scale-down=alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = 1
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 300
  statistic = "Average"
  threshold = 3
  alarm_description = "Alarm for scale down"
  alarm_actions = [aws_autoscaling_policy.scale_down_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.application.name
  }
}
