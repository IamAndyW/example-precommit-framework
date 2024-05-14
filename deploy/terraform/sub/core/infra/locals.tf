locals {
  component_id_map = {
    infra = "infra"
  }
  component_id = local.component_id_map[var.component]

  resource_tags = merge(
    module.namer.mandatory_resource_tags,
    {}
  )
}
