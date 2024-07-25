resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "${var.prefix}-${var.cluster_name}-subnet-group"
  subnet_ids = aws_subnet.subnets[*].id

  tags = {
    Name = "${var.prefix}-db-subnet-group"
  }
}
// Default RDS
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

// Aurora RDS
resource "aws_rds_cluster" "api-db" {
  cluster_identifier     = "${var.prefix}-${var.cluster_name}"
  engine                 = "aurora-postgresql"
  availability_zones     = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]
  database_name          = "tangramgame"
  master_username        = "postgres"
  master_password        = "tangramgame2020"
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.sg.id]
  skip_final_snapshot    = true
  apply_immediately      = true

  tags = {
    Name = "${var.prefix}-keycloak-db"
  }
}


resource "aws_rds_cluster_instance" "db-inst" {
  cluster_identifier  = aws_rds_cluster.api-db.id
  instance_class      = "db.serverless"
  engine              = aws_rds_cluster.api-db.engine
  engine_version      = aws_rds_cluster.api-db.engine_version
  publicly_accessible = true
}
