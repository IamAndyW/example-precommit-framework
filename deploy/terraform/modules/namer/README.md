# Terraform Module: Namer

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_region"></a> [azure\_region](#input\_azure\_region) | The Azure region of the resource | `string` | n/a | yes |
| <a name="input_company_id"></a> [company\_id](#input\_company\_id) | The company id of the resource | `string` | n/a | yes |
| <a name="input_component"></a> [component](#input\_component) | The name of the component the resource relates to | `string` | n/a | yes |
| <a name="input_component_id"></a> [component\_id](#input\_component\_id) | The id of the component the resource relates to | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the resource relates to | `string` | n/a | yes |
| <a name="input_landing_zone"></a> [landing\_zone](#input\_landing\_zone) | The landing zone of the resource | `string` | n/a | yes |
| <a name="input_pipeline"></a> [pipeline](#input\_pipeline) | The deployment pipeline | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The source code repository | `string` | n/a | yes |
| <a name="input_resource_scope"></a> [resource\_scope](#input\_resource\_scope) | The scope of the resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_paired_region"></a> [azure\_paired\_region](#output\_azure\_paired\_region) | The Azure paired region based on the primary resource location |
| <a name="output_azure_paired_region_id"></a> [azure\_paired\_region\_id](#output\_azure\_paired\_region\_id) | The Azure paired region id based on the primary resource location |
| <a name="output_azure_region_id"></a> [azure\_region\_id](#output\_azure\_region\_id) | The Azure region id which is used with the 'resource\_prefix' naming convention |
| <a name="output_mandatory_resource_tags"></a> [mandatory\_resource\_tags](#output\_mandatory\_resource\_tags) | Terraform map of manadatory resource tags and their value |
| <a name="output_resource_names"></a> [resource\_names](#output\_resource\_names) | Terraform map of resources and their generated full resource name |
| <a name="output_resource_prefix"></a> [resource\_prefix](#output\_resource\_prefix) | The resource prefix without the resource type |
| <a name="output_resource_prefix_short"></a> [resource\_prefix\_short](#output\_resource\_prefix\_short) | The resource prefix shortened without the resource type |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
