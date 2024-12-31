##Web Instance ids
output "web_instance_ids" {
  value = module.web.instance_ids
}

##ap Instance ids
output "ap_instance_ids" {
  value = module.ap.instance_ids
}

##ALB DNS Name
output "alb_dns_name" {
  value = module.web.alb_dns_name
}

##ALB Domain id
output "alb_zone_id" {
  value = module.web.alb_zone_id
}

