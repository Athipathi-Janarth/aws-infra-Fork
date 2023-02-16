resource "aws_internet_gateway" "myInternetGateway" {
  vpc_id = aws_vpc.myVpc.id

  tags = {
    Name = var.GATEWAY_NAME
  }
}
