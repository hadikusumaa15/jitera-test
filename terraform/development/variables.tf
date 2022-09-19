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
  default     = "development"
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

# IP architecture
# https://www.notion.so/iruuzainc/IP-architecture-85d035693086447c88fcf286f682d21b

variable "database_name" {
  description = "Name of database name"
  default     = "recipes_development"
}

variable "database_user" {
  description = "Name of database user"
  default     = "recipes_development"
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
  default     = "staging"
}

variable "web_container_name" {
  description = "Name of the web container image"
  default     = "recipes_development_web"
}

variable "zone_id" {
  description = "Zone ID"
  default     = "Z04107792MSQNTH3X9AUZ"
}

variable "domain" {
  description = "Domain"
  default     = "recipes-development.project.jitera.app"
}

variable "vpc_name" {
  description = "VPC Name"
  default     = "recipes_development"
}

variable "security_group_name" {
  description = "Security Group Name"
  default     = "recipes_development"
}

variable "redis_name" {
  description = "Redis Name"
  default     = "recipes-development"
}

variable "rds_name" {
  description = "RDS Name"
  default     = "recipes_development"
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