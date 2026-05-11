module "RDS" {
  source              = "./Modules/RDS"
  instance_name       = var.instance_name
  db_name             = var.db_name
  vpc_id              = var.vpc_id
  subnet_ids          = var.subnet_ids
  security_group_name = var.security_group_name
  allocated_storage   = var.allocated_storage
  engine_name         = var.engine_name
  engine_version      = var.engine_version
  db_class            = var.db_class
  db_credentials      = var.db_credentials
}