variable "instance_name" {
  type        = string
  description = "RDS instance identifier"
}

variable "db_name" {
  type        = string
  description = "Database name to create inside the instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where RDS will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for RDS subnet group"
}

variable "security_group_name" {
  type        = string
  description = "Name for the RDS security group"
}

variable "allocated_storage" {
  type    = number
  default = 10
}

variable "engine_name" {
  type        = string
  description = "db engine name eg. mysql,postgres"
}

variable "engine_version" {
  type    = string
  default = "14.12"
}

variable "db_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_credentials" {
  type = object({
    username = string
    password = string
  })
  sensitive = true
}
