data "template_file" "cloutrail_create_table" {
  template = "${file("${path.module}/cloudtrail_table.sql")}"
  vars = {
    cloudtrail_bucket_name = "${var.cloudtrail_bucket_name}"
    aws_account_id         = "${var.aws_account_id}"
  }
}

data "template_file" "alb_access_log" {
  template = "${file("${path.module}/alb_access_table.sql")}"
  vars = {
    access_log_bucket_name = "${var.access_log_bucket_name}"
    aws_account_id         = "${var.aws_account_id}"
  }
}
