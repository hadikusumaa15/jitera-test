

resource "aws_cloudwatch_log_group" "rds_error" {
  name              = "/aws/rds/instance/${var.name}/error"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "rds_general" {
  name              = "/aws/rds/instance/${var.name}/general"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "rds_slowquery" {
  name              = "/aws/rds/instance/${var.name}/slowquery"
  retention_in_days = 14
}
