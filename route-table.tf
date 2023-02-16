resource "aws_route_table" "rtblPublic" {
  vpc_id = aws_vpc.myVpc.id

  route {
    cidr_block = var.PUBLIC_CIDR_BLOCK
    gateway_id = aws_internet_gateway.myInternetGateway.id
  }

  tags = {
    Name = var.PUBLIC_ROUTE_TABLE
  }
}

resource "aws_route_table_association" "routepublic" {
  count          = var.COUNT
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.rtblPublic.id
}

resource "aws_route_table" "rtblPrivate" {
  vpc_id = aws_vpc.myVpc.id

  tags = {
    Name = var.PRIVATE_ROUTE_TABLE
  }
}

resource "aws_route_table_association" "routeprivate" {
  count          = var.COUNT
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.rtblPrivate.id
}