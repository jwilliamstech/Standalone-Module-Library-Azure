
resource "azurerm_managed_disk" "md" {
  name                 = local.md_name
  location             = var.region
  resource_group_name  = var.rg_name
  storage_account_type = var.md_sat
  create_option        = var.md_create_option
  disk_size_gb         = var.md_disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "avmdda" {
  managed_disk_id    = azurerm_managed_disk.md.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm_win.id
  lun                = var.avmdda_lun
  caching            = var.avmdda_caching
}
