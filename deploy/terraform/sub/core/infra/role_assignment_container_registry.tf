# # // ACR //
# resource "azurerm_role_assignment" "acr_user_access_administrator" {
#   for_each = var.acr_data_source_objectids

#   scope                = azurerm_container_registry.this.id
#   role_definition_name = "User Access Administrator"
#   principal_id         = each.value
# }

# resource "azurerm_role_assignment" "acr_listcredentials" {
#   for_each = var.acr_data_source_objectids

#   scope              = azurerm_container_registry.this.id
#   role_definition_id = azurerm_role_definition.acr_listcredentials.role_definition_resource_id
#   principal_id       = each.value
# }

# resource "azurerm_role_assignment" "acr_acrpush" {
#   for_each = var.acr_acrpush_objectids

#   scope                = azurerm_container_registry.this.id
#   role_definition_name = "AcrPush"
#   principal_id         = each.value
# }

# resource "azurerm_role_assignment" "acr_reader" {
#   for_each = var.acr_reader_objectids

#   scope                = azurerm_container_registry.this.id
#   role_definition_name = "Reader"
#   principal_id         = each.value
# }
