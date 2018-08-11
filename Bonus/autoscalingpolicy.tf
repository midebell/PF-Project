# scale up alarm

resource "aws_autoscaling_policy" "us_server-cpu-policy" {
  name                   = "us_server-cpu-policy"
  autoscaling_group_name = "${aws_autoscaling_group.us_server-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "us_server-cpu-alarm" {
  alarm_name          = "us_server-cpu-alarm"
  alarm_description   = "us_server-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.us_server-autoscaling.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.us_server-cpu-policy.arn}"]
}

# scale down alarm
resource "aws_autoscaling_policy" "us_server-cpu-policy-scaledown" {
  name                   = "us_server-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.us_server-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "us_server-cpu-alarm-scaledown" {
  alarm_name          = "us_server-cpu-alarm-scaledown"
  alarm_description   = "us_server-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.us_server-autoscaling.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.us_server-cpu-policy-scaledown.arn}"]
}