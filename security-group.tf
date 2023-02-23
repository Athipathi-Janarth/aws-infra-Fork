resource "aws_security_group" "application" {
  name        = "application_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myVpc.id


  ingress = [
    for port in var.INGRESS_PORT : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = [var.PUBLIC_CIDR_BLOCK]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "application"
  }
}