##Security Group ids
output "internal_sg_id" {
  value = module.internal_sg.security_group_id
}

output "operation_sg_1_id" {
  value = module.operation_sg_1.security_group_id
}

output "operation_sg_2_id" {
  value = module.operation_sg_2.security_group_id
}

output "operation_sg_3_id" {
  value = module.operation_sg_3.security_group_id
}

output "alb_http_sg_id" {
  value = module.alb_http_sg.security_group_id
}

output "alb_https_sg_id" {
  value = module.alb_https_sg.security_group_id
}

##Instance ids
output "instance_ids" {
  value = module.web.instance_ids
}

##ALB DNS Name
output "alb_dns_name" {
  value = module.web.alb_dns_name
}

##ALB Domain id
output "alb_zone_id" {
  value = module.web.alb_zone_id
}

