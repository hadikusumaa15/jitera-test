
output "db_endpoint" {
  description = "Db endpoint"
  value       = module.db.this_db_instance_endpoint
}

output "id" {
  description = "id of the database"
  value       = module.db.this_db_instance_id
}
