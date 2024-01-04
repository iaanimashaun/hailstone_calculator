resource "azurerm_resource_group" "hailstone-grp" {
  name = "hailstone-grp"
  location = "East US"
}

resource "azurerm_storage_account" "hailstone-storage-account" {
  name = "hailstone-storage-account"
  location = azurerm_resource_group.fun-grp.location
  resource_group_name = azurerm_resource_group.fun-grp.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "hailstone-srv-plan" {
  name = "hailstone-srv-plan"
  location = azurerm_resource_group.fun-grp.location
  resource_group_name = azurerm_resource_group.fun-grp.name
  os_type = "Linux"
  sku_name = "Y1"
}

resource "azurerm_linux_function_app" "hailstone_app" {
  name = "hailstone_app"
  location = azurerm_resource_group.fun-grp.location
  resource_group_name = azurerm_resource_group.fun-grp.name
  storage_account_name = azurerm_storage_account.fun-str-acc.name
  storage_account_access_key = azurerm_storage_account.fun-str-acc.primary_access_key
  service_plan_id = azurerm_service_plan.fun-srv-plan.id
  site_config {
  }
 } 
  