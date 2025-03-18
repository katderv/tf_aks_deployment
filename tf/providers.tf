terraform {
  required_version = ">=1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.51, < 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">= 0.7.0"  # Ensure this version is compatible with your setup
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "random" {}

provider "azapi" {
  use_oidc = true    
  use_msi = false     
}