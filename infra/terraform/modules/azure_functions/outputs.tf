output "function_app_id" {
  description = "ID of the Azure Function App"
  value       = azurerm_linux_function_app.function_app.id
}

output "function_app_url" {
  description = "URL of the Azure Function App"
  value       = azurerm_linux_function_app.function_app.default_hostname
}
