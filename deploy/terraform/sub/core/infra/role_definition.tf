resource "azurerm_role_definition" "acr_listcredentials" {
  name        = "ACR List Credentials ${title(var.resource_scope)} ${title(terraform.workspace)}"
  scope       = azurerm_container_registry.this.id
  description = "Lists the login credentials for the specified container registry."

  permissions {
    actions = [
      "Microsoft.ContainerRegistry/registries/listCredentials/action"
    ]
  }
}
