resource "aws_db_parameter_group" "db_parameter_group" {
  name   = "db-parameter-group"
  family = "mysql8.0"
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "db_subnet_group"
  description = "Subnet group for a database"

  subnet_ids = [aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id]

  tags = {
    Name = "db_subnet_group"
  }
}