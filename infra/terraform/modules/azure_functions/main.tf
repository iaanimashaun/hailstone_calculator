






  resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "service_plan" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = var.os_type
  sku_name = var.sku_name

}

resource "azurerm_linux_function_app" "function_app" {
  name                      = var.function_app_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  storage_account_name      = azurerm_storage_account.storage_account.name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id           = azurerm_service_plan.service_plan.id
  site_config {
  }
}
