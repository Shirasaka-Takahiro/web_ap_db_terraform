output "instance_ids" {
  value = aws_instance.ap.*.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.default_topic.arn
}