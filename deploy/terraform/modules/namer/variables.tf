# // COMPANY //
variable "company_id" {
  description = "The company id of the resource"
  type        = string
  sensitive   = false
}

variable "landing_zone" {
  description = "The landing zone of the resource"
  type        = string
  sensitive   = false

  validation {
    condition = contains([
      "local",
      "core",
      "connectivity",
      "management",
      "compute"
    ], var.landing_zone)
    error_message = "Valid values: local, core, connectivity, management, compute."
  }
}

variable "resource_scope" {
  description = "The scope of the resource"
  type        = string
  sensitive   = false

  validation {
    condition = contains([
      "sub", # subscription
      "env", # environment
    ], var.resource_scope)
    error_message = "Valid values: sub, env."
  }
}

variable "environment" {
  description = "The environment the resource relates to"
  type        = string
  sensitive   = false

  validation {
    condition = contains([
      "default", # Terraform default workspace
      "shared",
      "nonprod",
      "team",
      "dev",
      "prod",
    ], var.environment)
    error_message = "Valid values: default, shared, nonprod, team, prod."
  }
}

variable "azure_region" {
  description = "The Azure region of the resource"
  type        = string
  sensitive   = false

  validation {
    condition = contains([
      "uksouth",
      "ukwest",
      "westeurope",
      "northeurope",
      "eastus",
      "eastus2",
      "westus2",
      "westus3",
      "centralus",
      "westcentralus"
    ], var.azure_region)
    error_message = "Valid values: uksouth, ukwest, westeurope, northeurope, eastus, eastus2, westus2, westus3, centralus, westcentralus."
  }
}

variable "component" {
  description = "The name of the component the resource relates to"
  type        = string
  sensitive   = false
}

variable "component_id" {
  description = "The id of the component the resource relates to"
  type        = string
  sensitive   = false
}

variable "repository" {
  description = "The source code repository"
  type        = string
  sensitive   = false
}

variable "pipeline" {
  description = "The deployment pipeline"
  type        = string
  sensitive   = false
}
