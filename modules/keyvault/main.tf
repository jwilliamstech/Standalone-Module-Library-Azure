
resource "azurerm_key_vault" "vpkeyvault" {
  name                            = var.kv_name
  location                        = var.region
  resource_group_name             = var.rg_name
  enabled_for_disk_encryption     = var.disk_encryption_enabled
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = var.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  sku_name                        = var.sku_name
  rbac_authorization_enabled      = var.enable_kv_rbac
  enabled_for_deployment          = var.enabled_for_deployment
  tags                            = var.vpt_tags
  network_acls {
    default_action             = var.nacls_def_action
    bypass                     = var.nacls_bypass
    virtual_network_subnet_ids = var.snet_ids
    ip_rules                   = var.kv_ip_rules
  }
}

module "vpkeyvault_pe" {
  source                = "../privateendpoint"
  pe_name               = var.pe_name
  region                = var.region
  rg_name               = var.rg_name
  snet_id               = var.private_endpoint_snet_id
  psc_pe_to_stg_name    = var.psc_kv_name
  psc_resource_id       = azurerm_key_vault.vpkeyvault.id
  pe_sub_resource_names = [var.pe_sub_resource]
  pdnszg_ids            = [var.pdnszg_id]
  vpt_tags              = var.vpt_tags
}

