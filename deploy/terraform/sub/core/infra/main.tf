module "namer" {
  source = "../../../modules/namer"

  # inputs
  company_id     = var.company_id
  landing_zone   = var.landing_zone
  resource_scope = var.resource_scope
  environment    = terraform.workspace
  azure_region   = var.azure_region
  component      = var.component
  component_id   = local.component_id
  repository     = var.repository
  pipeline       = lower(var.pipeline)
}

resource "azurerm_resource_group" "this" {
  name     = module.namer.resource_names.resource_group
  location = var.azure_region
  tags     = local.resource_tags
}

module "vpc_created_from_local_module_without_flow_logs" {
  source = "../../../modules/aws/vpc"
}
