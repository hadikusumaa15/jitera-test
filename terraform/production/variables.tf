///////////////////////////////////////////////////////////////////////////
# Need to get the credential from AWS SSM
///////////////////////////////////////////////////////////////////////////

variable "database_password" {
  description = "Name of database password"
}

variable "rails_master_key" {
  description = "Encrypted key as rails master key"
}

variable "github_token" {
  description = "Github personal access token"
}

variable "docker_username" {
  description = "ARN of ssl certs"
}

variable "docker_password" {
  description = "Docker Passwrd"
}

///////////////////////////////////////////////////////////////////////////
# Please update default values if needed
///////////////////////////////////////////////////////////////////////////

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "recipes"
}

variable "env" {
  description = "Environment that is used as placeholder"
  default     = "production"
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

# IP architecture
# https://www.notion.so/iruuzainc/IP-architecture-85d035693086447c88fcf286f682d21b

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "10.20.144.0/24"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  default     = ["10.20.128.0/24", "10.20.129.0/24"]
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  default     = ["10.20.192.0/26", "10.20.192.64/26"]
}

variable "elasticache_subnets" {
  description = "Elasticache Subnets"
  default     = ["10.20.193.0/26", "10.20.193.64/26"]
}

variable "database_name" {
  description = "Name of database name"
  default     = "recipes_production"
}

variable "database_user" {
  description = "Name of database user"
  default     = "recipes_production"
}

variable "lb_healthcheck_path" {
  description = "Path of loadbalancer's health check"
  default     = "/health"
}

variable "github_account" {
  description = "Github account name of access token"
  default     = "Jitera"
}

variable "github_repository" {
  description = "Github repository to get source"
  default     = ""
}

variable "github_branch" {
  description = "Git branch to get source"
  default     = "master"
}

variable "web_container_name" {
  description = "Name of the web container image"
  default     = "recipes_production_web"
}

variable "zone_id" {
  description = "Zone ID"
  default     = "Z04107792MSQNTH3X9AUZ"
}

variable "domain" {
  description = "Domain"
  default     = "recipes-production.project.jitera.app"
}

variable "vpc_name" {
  description = "VPC Name"
  default     = "recipes_production"
}

variable "security_group_name" {
  description = "Security Group Name"
  default     = "recipes_production"
}

variable "redis_name" {
  description = "Redis Name"
  default     = "recipes-production"
}

variable "rds_name" {
  description = "RDS Name"
  default     = "recipes_production"
}

variable "slack_channel_id" {
  description = "Slack Channel identifier"
  default     = "C01FG7MNH8C"
}

variable "slack_workspace_id" {
  description = "Slack Workspace identifier"
  default     = "T68H309JS"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  default     = "677804650362"
}