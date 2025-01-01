variable "general_config" {
  type = map(any)
}
variable "private_subnet_ids" {}
variable "engine_name" {}
variable "major_engine_version" {}
variable "engine" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "instance_class" {}
variable "storage_type" {}
variable "allocated_storage" {}
variable "multi_az" {}
variable "internal_sg_id" {}
variable "topic_name" {}
variable "sns_email" {
  type = list(string)
}
variable "cloudwatch_alarms" {
  type = map(object({
    project                 = string
    env                     = string
    rds_identifier          = string
    cwa_metric_name         = string
    cwa_statistic           = string
    cwa_period              = number
    cwa_threshold           = number
    cwa_comparison_operator = string
    cwa_evaluation_periods  = number
    cwa_actions             = bool
    sns_topic_arn           = string
  }))
}