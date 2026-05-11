resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.instance_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds_sg" {
  name        = var.security_group_name
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier             = var.instance_name
  db_name                = var.db_name
  allocated_storage      = var.allocated_storage
  engine                 = var.engine_name
  engine_version         = var.engine_version
  instance_class         = var.db_class
  username               = var.db_credentials.username
  password               = var.db_credentials.password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  tags = {
    DataClassification = "Internal Use Only"
  }
}