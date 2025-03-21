resource "azurerm_subnet" "test" {
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_container_registry" "aks-acr" {
  retention_policy {
    days    = 7
    enabled = true
  }
}