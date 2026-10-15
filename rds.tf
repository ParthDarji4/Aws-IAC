resource "aws_db_subnet_group" "mysql" {
  name = "mysql-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "mysql-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier = "container-app-mysql"

  engine         = "mysql"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "appdb"
  username = "appadmin"
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false

  multi_az = false

  storage_encrypted = true

  backup_retention_period = 0

  skip_final_snapshot = true
  deletion_protection = false

  apply_immediately = true

  tags = {
    Name = "container-app-mysql"
  }
}