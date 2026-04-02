
resource "azurerm_linux_virtual_machine" "vm_centos" {
  name                  = var.vm_name
  resource_group_name   = var.rg_name
  location              = var.region
  size                  = var.vm_size
  tags                  = var.common_tags
  network_interface_ids = [azurerm_network_interface.thisnic.id]

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

  computer_name                   = local.computer_name
  admin_username                  = var.vm_admin_username
  disable_password_authentication = var.disable_password_authentication

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file(var.pub_key_location)
  }

  boot_diagnostics {
    storage_account_uri = module.diag_storage.primary_blob_endpoint
  }

}
