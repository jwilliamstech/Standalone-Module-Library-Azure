output "storage_id" {
  value = azurerm_storage_account.storage.id
}
output "storage_name" {
  value = azurerm_storage_account.storage.name
}
output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}
