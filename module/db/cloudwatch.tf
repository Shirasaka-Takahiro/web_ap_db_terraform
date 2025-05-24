##Cloudwatch RDS
resource "aws_cloudwatch_metric_alarm" "rds_default" {
  for_each = var.cloudwatch_alarms

  alarm_name          = "${each.value["project"]}-${each.value["env"]}-${each.value["rds_identifier"]}-${each.value["cwa_metric_name"]}"
  metric_name         = each.value["cwa_metric_name"]
  namespace           = "AWS/RDS"
  statistic           = each.value["cwa_statistic"]
  period              = each.value["cwa_period"]
  threshold           = each.value["cwa_threshold"]
  comparison_operator = each.value["cwa_comparison_operator"]
  evaluation_periods  = each.value["cwa_evaluation_periods"]
  treat_missing_data  = "notBreaching"
  actions_enabled     = each.value["cwa_actions"]
  alarm_actions       = [each.value["sns_topic_arn"]]
  ok_actions          = [each.value["sns_topic_arn"]]
  dimensions = {
    DBInstanceIdentifier = each.value["rds_identifier"]
  }
}