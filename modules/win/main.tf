
resource "azurerm_windows_virtual_machine" "vm_win" {
  name                  = var.vm_name
  resource_group_name   = var.rg_name
  location              = var.region
  size                  = var.vm_size
  tags                  = var.common_tags
  network_interface_ids = [azurerm_network_interface.thisnic.id]
  admin_username        = var.vm_admin_username
  admin_password        = var.vm_admin_pass
  computer_name         = local.computer_name

  os_disk {
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_sat
  }
  source_image_reference {
    publisher = var.source_image.publisher
    offer     = var.source_image.offer
    sku       = var.source_image.sku
    version   = var.source_image.version
  }
  boot_diagnostics {
    storage_account_uri = module.diag_storage.primary_blob_endpoint
  }

}
