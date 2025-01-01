##Cloudwatch EC2
resource "aws_cloudwatch_metric_alarm" "ec2_statuscheckfailed" {
  count               = var.ec2_count
  alarm_name          = "${var.general_config["project"]}-${var.general_config["env"]}-${element(var.instance_ids, count.index)}-StatusCheckFailed"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 300
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  treat_missing_data  = "notBreaching"
  actions_enabled     = var.cwa_actions
  alarm_actions       = [var.sns_topic_arn]
  ok_actions          = [var.sns_topic_arn]
  dimensions = {
    InstanceId = element(var.instance_ids, count.index)
  }
}