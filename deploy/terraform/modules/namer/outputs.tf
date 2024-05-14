output "resource_prefix" {
  description = "The resource prefix without the resource type"
  value       = local.resource_prefix
  sensitive   = false
}

output "resource_prefix_short" {
  description = "The resource prefix shortened without the resource type"
  value       = local.resource_prefix_short
  sensitive   = false
}

output "resource_names" {
  description = "Terraform map of resources and their generated full resource name"
  value       = local.resource_names
  sensitive   = false
}

output "mandatory_resource_tags" {
  description = "Terraform map of manadatory resource tags and their value"
  value       = local.mandatory_resource_tags
  sensitive   = false
}

output "azure_region_id" {
  description = "The Azure region id which is used with the 'resource_prefix' naming convention"
  value       = local.azure_region_id
  sensitive   = false
}

output "azure_paired_region" {
  description = "The Azure paired region based on the primary resource location"
  value       = local.azure_paired_region
  sensitive   = false
}

output "azure_paired_region_id" {
  description = "The Azure paired region id based on the primary resource location"
  value       = local.azure_paired_region_id
  sensitive   = false
}
