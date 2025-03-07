# DB subnet group using existing private subnets
resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet2.id
  ]
}

# RDS MySQL instance
resource "aws_db_instance" "mysql_db" {
  identifier           = "mysql-db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  db_name              = "mydb"
  username             = "admin"
  password             = "password123!" # Store securely in practice

  # Network settings
  db_subnet_group_name    = aws_db_subnet_group.mysql_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  skip_final_snapshot  = true
  publicly_accessible  = false
}
