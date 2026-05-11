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
  validation {
    condition     = var.allocated_storage <= 10
    error_message = "only upto 10 GB can be allocated for sandbox environment lab"
  }
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
  validation {
    condition     = contains(["db.t3.micro", "db.t4.micro"], var.db_class)
    error_message = "only db.t3.micro or db.t4.micro instance class is allowed in sandbox environment lab"
  }
}

variable "db_credentials" {
  type = object({
    username = string
    password = string
  })
  sensitive = true
  validation {
    condition     = can(regex("^.{8,}$", var.db_credentials.password)) && can(regex("[A-Z]", var.db_credentials.password)) && can(regex("[a-z]", var.db_credentials.password)) && can(regex("[0-9]", var.db_credentials.password)) && can(regex("[#?!@$%^&*-]", var.db_credentials.password))
    error_message = "Password must be at least 8 characters and contain uppercase, lowercase, number, and special character (#?!@$%^&*-)"
  }
}