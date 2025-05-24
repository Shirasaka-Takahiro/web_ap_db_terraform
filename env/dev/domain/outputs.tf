output "cert_alb_arn" {
  value = module.cert.cert_alb_arn
}

output "data" {
  value = {
    alb_dns_name = data.terraform_remote_state.alb_dns_name.outputs
    alb_zone_id  = data.terraform_remote_state.alb_zone_id.outputs
  }
}