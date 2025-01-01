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

  ##SNS
  topic_name = var.topic_name
  sns_email  = var.sns_email

  ##CloudWatch
  cloudwatch_alarms = {
    cpuutilization = {
      project                 = var.general_config["project"]
      env                     = var.general_config["env"]
      rds_identifier          = module.db.rds_identifier
      cwa_metric_name         = "CPUUtilization"
      cwa_statistic           = "Average"
      cwa_period              = 300
      cwa_threshold           = 1
      cwa_comparison_operator = "GreaterThanOrEqualToThreshold"
      cwa_evaluation_periods  = 1
      cwa_actions             = var.cwa_actions
      sns_topic_arn           = module.db.sns_topic_arn
    },
    freeablememory = {
      project                 = var.general_config["project"]
      env                     = var.general_config["env"]
      rds_identifier          = module.db.rds_identifier
      cwa_metric_name         = "FreeableMemory"
      cwa_statistic           = "Average"
      cwa_period              = 300
      cwa_threshold           = 1
      cwa_comparison_operator = "GreaterThanOrEqualToThreshold"
      cwa_evaluation_periods  = 1
      cwa_actions             = var.cwa_actions
      sns_topic_arn           = module.db.sns_topic_arn
    },
    freeablestorage = {
      project                 = var.general_config["project"]
      env                     = var.general_config["env"]
      rds_identifier          = module.db.rds_identifier
      cwa_metric_name         = "FreeStorageSpace"
      cwa_statistic           = "Average"
      cwa_period              = 300
      cwa_threshold           = 1
      cwa_comparison_operator = "LessThanOrEqualToThreshold"
      cwa_evaluation_periods  = 1
      cwa_actions             = var.cwa_actions
      sns_topic_arn           = module.db.sns_topic_arn
    }
  }
}