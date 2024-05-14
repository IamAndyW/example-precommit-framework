output "azure_container_registry_resource_group_name" {
  description = "Resource Group name for platform core resources"
  value       = azurerm_resource_group.this.name
  sensitive   = false
}

output "azure_container_registry_name" {
  description = "Container Registry name"
  value       = azurerm_container_registry.this.name
  sensitive   = false
}
