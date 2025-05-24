##Provider for ap-northeast-1
provider "aws" {
  profile    = "terraform-user"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "ap-northeast-1"
}

##EC2
module "web" {
  source = "../../../module/web"

  ##EC2
  general_config    = var.general_config
  ec2_count         = var.ec2_count
  ami               = var.ami
  public_subnet_ids = data.terraform_remote_state.public_subnet_ids.outputs.public_subnet_ids
  internal_sg_id    = data.terraform_remote_state.internal_sg_id.outputs.internal_sg_id
  operation_sg_1_id = data.terraform_remote_state.operation_sg_1_id.outputs.operation_sg_1_id
  operation_sg_2_id = data.terraform_remote_state.operation_sg_2_id.outputs.operation_sg_2_id
  operation_sg_3_id = data.terraform_remote_state.operation_sg_3_id.outputs.operation_sg_3_id
  key_name          = data.terraform_remote_state.key_pair_name.outputs.key_pair_name
  instance_type     = var.instance_type
  volume_type       = var.volume_type
  volume_size       = var.volume_size

  ##ALB
  alb_http_sg_id  = data.terraform_remote_state.alb_http_sg_id.outputs.alb_http_sg_id
  alb_https_sg_id = data.terraform_remote_state.alb_https_sg_id.outputs.alb_https_sg_id
  instance_ids    = module.web.instance_ids
  vpc_id          = data.terraform_remote_state.vpc_id.outputs.vpc_id
  #cert_alb_arn    = data.terraform_remote_state.cert_alb_arn.outputs.cert_alb_arn

  ##SNS
  topic_name = var.topic_name
  sns_email  = var.sns_email

  ##CloudWatch
  alb_name       = module.web.alb_name
  sns_topic_arn  = module.web.sns_topic_arn
  cwa_actions    = var.cwa_actions
  tg_arn_suffix  = module.web.tg_arn_suffix
  alb_arn_suffix = module.web.alb_arn_suffix
}