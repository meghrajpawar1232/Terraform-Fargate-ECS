# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "dev_log_group" {
  name              = "/ecs/dev-app"
  retention_in_days = 30

  tags = {
    Name = "dev-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "dev_log_stream" {
  name           = "dev-log-stream"
  log_group_name = aws_cloudwatch_log_group.dev_log_group.name
}