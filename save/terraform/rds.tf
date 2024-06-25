resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "${var.prefix}-${var.cluster_name}-subnet-group"
  subnet_ids = aws_subnet.subnets[*].id

  tags = {
    Name = "${var.prefix}-db-subnet-group"
  }
}

resource "aws_db_instance" "api-db" {
  allocated_storage      = 10
  identifier             = "${var.prefix}-${var.cluster_name}-db"
  db_name                = "${var.prefix}-${var.cluster_name}"
  engine                 = "postgres"
  engine_version         = "15.5"
  instance_class         = "db.t3.micro"
  username               = ""
  password               = ""
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
  tags = {
    Name = "${var.prefix}-keycloak-db"
  }
}
