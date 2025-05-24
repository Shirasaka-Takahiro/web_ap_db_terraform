##Provider for ap-northeast-1
provider "aws" {
  profile    = "terraform-user"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "ap-northeast-1"
}

##Domain
module "domain" {
  source = "../../../module/domain/route53"

  zone_id      = var.zone_id
  zone_name    = var.zone_name
  alb_dns_name = data.terraform_remote_state.alb_dns_name.outputs.alb_dns_name
  alb_zone_id  = data.terraform_remote_state.alb_zone_id.outputs.alb_zone_id
}

##Cert
module "cert" {
  source = "../../../module/domain/acm"

  domain_name = var.domain_name
  sans        = var.sans
  zone_id     = var.zone_id
}