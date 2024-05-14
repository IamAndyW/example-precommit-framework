# // Naming //
variable "company_id" {
  description = "The company id of the resource"
  type        = string
  sensitive   = false
  default     = "awed"
}
variable "landing_zone" {
  description = "The landing zone of the resource"
  type        = string
  sensitive   = false
  default     = "core"
}

variable "resource_scope" {
  description = "The scope of the resource"
  type        = string
  sensitive   = false
  default     = "sub"
}

variable "component" {
  description = "The name of the component the resource relates to"
  type        = string
  sensitive   = false
  default     = "infra"
}

# // GitHub //
variable "repository" {
  description = "The source code repository"
  type        = string
  sensitive   = false
  default     = "-"
}

variable "pipeline" {
  description = "The deployment pipeline"
  type        = string
  sensitive   = false
  default     = "-"
}


# // Azure //
variable "azure_region" {
  description = "The Azure region"
  type        = string
  sensitive   = false
}

variable "azure_container_registry_sku" {
  description = "The resource SKU"
  type        = string
  sensitive   = false
  default     = "Standard"
}

// Azure AD //
# variable "acr_data_source_objectids" {
#   type        = set(string)
#   description = "Object ids to enable Terraform data source lookup against the ACR"
#   default = [
#     "23bf7438-76d1-4921-bbc8-7f19cef8a65c", # am-platform-compute-team-iac
#     "590e8416-e327-4bab-bd78-1bb1b4e02333", # am-platform-compute-production-iac
#     "58e5fa7c-8805-4572-87ef-09bab2ec75a7"  # am-publications-team-iac
#   ]
# }

# variable "acr_acrpush_objectids" {
#   type        = set(string)
#   description = "Object ids to grant AcrPush role"
#   default = [
#     "b4d06bc7-9174-49f6-bbbe-94a02cf42d10", # am-platform-compute-team-deploy
#   ]
# }

# variable "acr_reader_objectids" {
#   type        = set(string)
#   description = "Object ids to grant reader role"
#   default = [
#     "b4d06bc7-9174-49f6-bbbe-94a02cf42d10", # am-platform-compute-team-deploy
#   ]
# }
