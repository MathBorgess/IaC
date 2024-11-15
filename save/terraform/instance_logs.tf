resource "aws_cloudwatch_log_group" "ec2_logs" {
  name              = "/aws/ec2/${aws_instance.host.id}"
  retention_in_days = 30

  tags = {
    Environment = "production"
    Instance    = aws_instance.host.id
  }
}

resource "aws_cloudwatch_log_stream" "ec2_stream" {
  name           = "ec2-instance-logs"
  log_group_name = aws_cloudwatch_log_group.ec2_logs.name
}
