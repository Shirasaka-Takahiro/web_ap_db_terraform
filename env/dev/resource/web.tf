##Provider for ap-northeast-1
provider "aws" {
  profile    = "terraform-user"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "ap-northeast-1"
}

data "terraform_remote_state" "vpc_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "public_subnet_ids" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "cert_alb_arn" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-domain.tfstate"
    region = "ap-northeast-1"
  }
}

##Security Group Internal
module "internal_sg" {
  source = "../../../module/common/securitygroup"

  general_config = var.general_config
  vpc_id      = data.terraform_remote_state.vpc_id.outputs.vpc_id
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["10.0.0.0/16"]
  sg_role     = "internal"
}

##Secutiry Group Operation
module "operation_sg_1" {
  source = "../../../module/common/securitygroup"

  general_config = var.general_config
  vpc_id      = data.terraform_remote_state.vpc_id.outputs.vpc_id
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.operation_sg_1_cidr
  sg_role     = "operation_1"
}

module "operation_sg_2" {
  source = "../../../module/common/securitygroup"

  general_config = var.general_config
  vpc_id      = data.terraform_remote_state.vpc_id.outputs.vpc_id
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.operation_sg_2_cidr
  sg_role     = "operation_2"
}

module "operation_sg_3" {
  source = "../../../module/common/securitygroup"

  general_config = var.general_config
  vpc_id      = data.terraform_remote_state.vpc_id.outputs.vpc_id
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.operation_sg_3_cidr
  sg_role     = "operation_3"
}

module "alb_http_sg" {
  source = "../../../module/common/securitygroup"

  general_config = var.general_config
  vpc_id      = data.terraform_remote_state.vpc_id.outputs.vpc_id
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  sg_role     = "alb_http"
}

module "alb_https_sg" {
  source = "../../../module/common/securitygroup"

  general_config = var.general_config
  vpc_id      = data.terraform_remote_state.vpc_id.outputs.vpc_id
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  sg_role     = "alb_https"
}

##EC2
module "web" {
  source = "../../../module/web"

  ##EC2
  general_config = var.general_config
  ec2_count      = var.ec2_count
  ami            = var.ami
  public_subnet_ids = data.terraform_remote_state.public_subnet_ids.outputs.public_subnet_ids
  internal_sg_id    = module.internal_sg.security_group_id
  operation_sg_1_id = module.operation_sg_1.security_group_id
  operation_sg_2_id = module.operation_sg_2.security_group_id
  operation_sg_3_id = module.operation_sg_3.security_group_id
  key_name          = var.key_name
  public_key_path   = var.public_key_path
  instance_type     = var.instance_type
  volume_type       = var.volume_type
  volume_size       = var.volume_size

  ##ALB
  alb_http_sg_id  = module.alb_http_sg.security_group_id
  alb_https_sg_id = module.alb_https_sg.security_group_id
  instance_ids = module.web.instance_ids
  vpc_id = data.terraform_remote_state.vpc_id.outputs.vpc_id
  cert_alb_arn = data.terraform_remote_state.cert_alb_arn.outputs.cert_alb_arn
}