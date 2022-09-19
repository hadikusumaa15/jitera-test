
output "access_log_bucket_id" {
  description = "The ID of the bucket for access log"
  value       = module.access_log_s3_bucket.this_s3_bucket_id
}

output "pipeline_artifact_bucket_id" {
  description = "The ID of the bucket for pipeline artifact"
  value       = module.pipeline_artifact_s3_bucket.this_s3_bucket_id
}

output "pipeline_artifact_bucket_arn" {
  description = "ARN of the bucket for pipeline artifact"
  value       = module.pipeline_artifact_s3_bucket.this_s3_bucket_arn
}

output "vpc_flow_log_arn" {
  description = "ARN of the bucket for vpc flow logging"
  value       = module.vpc_flow_s3_bucket.this_s3_bucket_arn
}

output "cloudtrail_bucket_id" {
  description = "The ID of the bucket for cloudtrail"
  value       = module.cloutrail_bucket.this_s3_bucket_id
}

output "athena_output_bucket_id" {
  description = "The ID of the bucket for athena"
  value       = module.athena_output_s3_bucket.this_s3_bucket_id
}
