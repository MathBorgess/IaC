resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = aws_subnet.subnets[*].id

  tags = {
    Name = "${var.prefix}-db-subnet-group"
  }
}

resource "aws_db_instance" "api-db" {
  allocated_storage    = 10
  identifier           = "apidb"
  db_name              = "apidb"
  engine               = "postgres"
  engine_version       = "15.5"
  instance_class       = "db.t3.micro"
  username             = "tangramdb"
  password             = "tangramdb"
  db_subnet_group_name = aws_db_subnet_group.db-subnet-group.name
  skip_final_snapshot  = true
  publicly_accessible  = true
  tags = {
    Name = "${var.prefix}-keycloak-db"
  }
}
