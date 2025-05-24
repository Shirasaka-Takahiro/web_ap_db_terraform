output "instance_ids" {
  value = aws_instance.web.*.id
}

output "alb_name" {
  value = aws_lb.alb.name
}

output "alb_arn_suffix" {
  value = aws_lb.alb.arn_suffix
}

output "alb_id" {
  value = aws_lb.alb.id
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.alb.zone_id
}

output "tg_arn_suffix" {
  value = aws_lb_target_group.tg.arn_suffix
}

output "sns_topic_arn" {
  value = aws_sns_topic.default_topic.arn
}