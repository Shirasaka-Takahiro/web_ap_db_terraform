##EC2
module "ap" {
  source = "../../../module/ap"

  ##EC2
  general_config     = var.general_config
  ec2_count          = var.ec2_count
  ami                = var.ami
  private_subnet_ids = data.terraform_remote_state.private_subnet_ids.outputs.private_subnet_ids
  internal_sg_id     = data.terraform_remote_state.internal_sg_id.outputs.internal_sg_id
  key_name           = data.terraform_remote_state.key_pair_name.outputs.key_pair_name
  instance_type      = var.instance_type
  volume_type        = var.volume_type
  volume_size        = var.volume_size

  ##SNS
  topic_name = var.topic_name
  sns_email  = var.sns_email

  ##CloudWatch
  instance_ids  = module.ap.instance_ids
  sns_topic_arn = module.ap.sns_topic_arn
  cwa_actions   = var.cwa_actions
}