terraform {
  backend "azurerm" {
    resource_group_name  = "awed-core-sub-shared-use-terraform-rg"
    storage_account_name = "awedcoresshusetfst"
    container_name       = "tfstate"
    key                  = "awed-sub-core-infa"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }

  required_version = "~> 1.0"
}

provider "azurerm" {
  features {}
}

provider "aws" {}
