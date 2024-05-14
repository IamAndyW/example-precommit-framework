# example-precommit-framework
Example repo demonstrating using the pre-commit framework


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.49.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.80.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_namer"></a> [namer](#module\_namer) | ../../../modules/namer | n/a |
| <a name="module_vpc_created_from_local_module_without_flow_logs"></a> [vpc\_created\_from\_local\_module\_without\_flow\_logs](#module\_vpc\_created\_from\_local\_module\_without\_flow\_logs) | ../../../modules/aws/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_definition.acr_listcredentials](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_container_registry_sku"></a> [azure\_container\_registry\_sku](#input\_azure\_container\_registry\_sku) | The resource SKU | `string` | `"Standard"` | no |
| <a name="input_azure_region"></a> [azure\_region](#input\_azure\_region) | The Azure region | `string` | n/a | yes |
| <a name="input_company_id"></a> [company\_id](#input\_company\_id) | The company id of the resource | `string` | `"awed"` | no |
| <a name="input_component"></a> [component](#input\_component) | The name of the component the resource relates to | `string` | `"infra"` | no |
| <a name="input_landing_zone"></a> [landing\_zone](#input\_landing\_zone) | The landing zone of the resource | `string` | `"core"` | no |
| <a name="input_pipeline"></a> [pipeline](#input\_pipeline) | The deployment pipeline | `string` | `"-"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | The source code repository | `string` | `"-"` | no |
| <a name="input_resource_scope"></a> [resource\_scope](#input\_resource\_scope) | The scope of the resource | `string` | `"sub"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_container_registry_name"></a> [azure\_container\_registry\_name](#output\_azure\_container\_registry\_name) | Container Registry name |
| <a name="output_azure_container_registry_resource_group_name"></a> [azure\_container\_registry\_resource\_group\_name](#output\_azure\_container\_registry\_resource\_group\_name) | Resource Group name for platform core resources |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
