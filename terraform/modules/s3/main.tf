
module "access_log_s3_bucket" {
  source                         = "terraform-aws-modules/s3-bucket/aws"
  version                        = "v1.20.0"
  bucket                         = var.access_log_name
  acl                            = "log-delivery-write"
  force_destroy                  = true
  attach_elb_log_delivery_policy = true
  tags = {
    Terraform = "true"
  }
}

module "pipeline_artifact_s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "v1.20.0"
  bucket        = var.pipeline_artifact_name
  acl           = "private"
  force_destroy = true
  tags = {
    Terraform = "true"
  }
}

module "vpc_flow_s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "v1.20.0"
  bucket        = var.vpc_flow_log_name
  acl           = "private"
  force_destroy = true
  tags = {
    Terraform = "true"
  }
}

module "cloudwatch_log_groups" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "v1.20.0"
  bucket        = var.cloudwatch_log_group_name
  acl           = "private"
  force_destroy = true
  tags = {
    Terraform = "true"
  }
  attach_policy = true
  policy        = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "logs.ap-northeast-1.amazonaws.com"
        },
        "Action": "s3:GetBucketAcl",
        "Resource": "arn:aws:s3:::${var.cloudwatch_log_group_name}"
    },
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "logs.ap-northeast-1.amazonaws.com"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::${var.cloudwatch_log_group_name}/*",
        "Condition": {
            "StringEquals": {
                "s3:x-amz-acl": "bucket-owner-full-control"
            }
        }
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "exec_ssh" {
  bucket = var.ecs_exec_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Terraform = "true"
  }
}

# CloudTrail
module "cloutrail_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "v1.20.0"
  bucket        = var.cloudtrail_bucket_name
  acl           = "private"
  force_destroy = true
  tags = {
    Terraform = "true"
  }

  lifecycle_rule = [
    {
      id      = "log"
      enabled = true

      expiration = {
        days = 90
      }
    }
  ]

  attach_policy = true
  policy        = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.cloudtrail_bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.cloudtrail_bucket_name}/AWSLogs/${var.aws_account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
EOF
}

module "athena_output_s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "v1.20.0"
  bucket        = var.athena_output_bucket_name
  acl           = "private"
  force_destroy = true
  tags = {
    Terraform = "true"
  }

  lifecycle_rule = [
    {
      id      = "log"
      enabled = true

      expiration = {
        days = 90
      }
    }
  ]
}