output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.db_instance.identifier
}

output "sns_topic_arn" {
  value = aws_sns_topic.default_topic.arn
}