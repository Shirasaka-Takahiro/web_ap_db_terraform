##RDS
module "db" {
  source = "../../../module/db"

  general_config       = var.general_config
  private_subnet_ids   = data.terraform_remote_state.private_subnet_ids.outputs.private_subnet_ids
  engine_name          = var.engine_name
  major_engine_version = var.major_engine_version
  engine               = var.engine
  engine_version       = var.engine_version
  username             = var.username
  password             = var.password
  instance_class       = var.instance_class
  storage_type         = var.storage_type
  allocated_storage    = var.allocated_storage
  multi_az             = var.multi_az
  internal_sg_id       = data.terraform_remote_state.internal_sg_id.outputs.internal_sg_id
}