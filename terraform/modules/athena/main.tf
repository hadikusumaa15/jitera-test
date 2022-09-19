locals {
  name = replace("${var.name}", "-", "_")
}

resource "aws_athena_workgroup" "default" {
  name = "${local.name}_default"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${var.athena_output_bucket_name}/output/"
    }
  }
}

resource "aws_athena_database" "default" {
  name = "${local.name}_default"
  bucket = var.athena_output_bucket_id
}

resource "aws_athena_named_query" "cloutrail" {
  name      = "${local.name}_cloutrail"
  workgroup = aws_athena_workgroup.default.id
  database  = aws_athena_database.default.name
  query     = "${data.template_file.cloutrail_create_table.rendered}"
}

resource "aws_athena_named_query" "alb_access_log" {
  name      = "${local.name}_alb_access_log"
  workgroup = aws_athena_workgroup.default.id
  database  = aws_athena_database.default.name
  query     = "${data.template_file.alb_access_log.rendered}"
}
