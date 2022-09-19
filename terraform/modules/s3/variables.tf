variable "access_log_name" {
  description = "Name to be used on s3 bucket name for access log"
  default     = ""
}

variable "pipeline_artifact_name" {
  description = "Name to be used on s3 bucket name for pipeline artifact"
  default     = ""
}

variable "vpc_flow_log_name" {
  description = "Name to be used on s3 bucket name for vpc flow logging"
  default     = ""
}

variable "cloudwatch_log_group_name" {
  description = "Name to be used on s3 bucket name for cloudwatch"
  default     = ""
}

variable "ecs_exec_bucket_name" {
  description = "Name to be used on s3 bucket name for ssh logging"
}

variable "aws_account_id" {
  description = "AWS Account ID"
}

variable "cloudtrail_bucket_name" {
  description = "Name to be used on s3 bucket name for cloudtrail"
}

variable "athena_output_bucket_name" {
  description = "Name to be used on s3 bucket name for athena"
}