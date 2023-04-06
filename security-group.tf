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
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.load_balancer.id]
      self             = false
    }
  ]
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "application"
  }
}
resource "aws_security_group" "database" {
  name        = "database-sg"
  description = "Database security group for RDS instances"

  vpc_id = aws_vpc.myVpc.id

  ingress {
    from_port       = var.RDS_PORT
    to_port         = var.RDS_PORT
    protocol        = "tcp"
    security_groups = [aws_security_group.application.id]
  }

  tags = {
    Name = "database"
  }
}
resource "aws_security_group" "load_balancer" {
  name        = "load_balancer_tls"
  description = "Security group for the load balancer"
  vpc_id      = aws_vpc.myVpc.id


  ingress = [
    for port in var.LOAD_BALANCER_INGRESS_PORT : {
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
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "load_balancer"
  }
}