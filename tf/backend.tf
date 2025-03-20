resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "main" {
  location = var.location
  name     = "${random_id.prefix.hex}-rg"
}

locals {
  resource_group = {
    name     = azurerm_resource_group.main.name
    location = var.location
  }
}

resource "azurerm_storage_account" "example" {
    name                     = "${random_id.prefix.hex}storageaccount"
    resource_group_name      = local.resource_group.name
    location                 = local.resource_group.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
    name                  = "${random_id.prefix.hex}container"
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "container_name" {
  value = azurerm_storage_container.example.name
}

output "resource_group_name" {
  value = local.resource_group.name
}