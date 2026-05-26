output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "id" {
  description = "ID of the launch template"
  value       = try(aws_launch_template.this[0].id, null)
}

output "arn" {
  description = "ARN of the launch template"
  value       = try(aws_launch_template.this[0].arn, null)
}

output "latest_version" {
  description = "Latest version number"
  value       = try(aws_launch_template.this[0].latest_version, null)
}
