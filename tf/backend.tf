terraform {
  backend "azurerm" {
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    resource_group_name  = var.resource_group_name
    access_key           = var.access_key
  }
}