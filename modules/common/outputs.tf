output "la_workspace_name" {
  value = azurerm_log_analytics_workspace.la_workspace.name
}

output "rs_vault_name" {
  value = azurerm_recovery_services_vault.rs_vault.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}
output "storage_account_uri" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}
