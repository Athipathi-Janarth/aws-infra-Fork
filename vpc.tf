data "aws_availability_zones" "available" {}
resource "aws_vpc" "myVpc" {
  cidr_block           = var.CIDR_BLOCK
  enable_dns_hostnames = true
  tags = {
    Name = var.VPC_NAME
  }
}
resource "aws_subnet" "public_subnet" {
  count                   = var.COUNT
  vpc_id                  = aws_vpc.myVpc.id
  cidr_block              = cidrsubnet(var.CIDR_BLOCK, 8, count.index + 10)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.PUBLIC_SUBNET_NAME}${count.index}"
  }
}
resource "aws_subnet" "private_subnet" {
  count                   = var.COUNT
  vpc_id                  = aws_vpc.myVpc.id
  cidr_block              = cidrsubnet(var.CIDR_BLOCK, 8, count.index + 20)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    count = length(var.PRIVATE_SUBNET_NAME)
    Name  = "${var.PRIVATE_SUBNET_NAME}${count.index}"
  }
}
