resource "aws_db_instance" "rds_instance" {
  identifier        = var.DB_NAME
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = var.DB_USER
  password          = var.DB_PASSWORD
  db_name           = var.DB_NAME
  multi_az          = false
  apply_immediately = true

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.database.id]
  parameter_group_name   = aws_db_parameter_group.db_parameter_group.name
  skip_final_snapshot    = true
  publicly_accessible    = false

  storage_encrypted = true
  kms_key_id = aws_kms_key.rds_encryption.arn
  tags = {
    Name = var.RDS_NAME
  }
}
