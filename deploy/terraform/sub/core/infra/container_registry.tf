resource "azurerm_container_registry" "this" {
  name                    = module.namer.resource_names.container_registry
  resource_group_name     = azurerm_resource_group.this.name
  location                = azurerm_resource_group.this.location
  sku                     = var.azure_container_registry_sku
  admin_enabled           = false
  zone_redundancy_enabled = var.azure_container_registry_sku == "Premium" ? true : false
  tags                    = local.resource_tags

  dynamic "retention_policy" {
    for_each = var.azure_container_registry_sku == "Premium" ? [1] : []
    content {
      days    = 10
      enabled = true
    }
  }
}
