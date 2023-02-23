resource "aws_instance" "ec2_instance" {
  ami                    = var.AMI_ID
  instance_type          = "t2.micro"
  key_name               = "ec2"
  subnet_id              = aws_subnet.public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.application.id]

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  tags = {
    Name = var.EC2_NAME
  }
  lifecycle {
    prevent_destroy = false
  }

}