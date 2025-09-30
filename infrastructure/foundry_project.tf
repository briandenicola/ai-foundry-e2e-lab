resource "azurerm_ai_foundry_project" "this" {
  name                           = local.project_name
  location                       = azurerm_ai_foundry.this.location
  ai_services_hub_id             = azurerm_ai_foundry.this.id

  identity {
    type = "SystemAssigned"
  }
}
