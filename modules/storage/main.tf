resource "azurerm_storage_account" "storage" {
  name                              = var.stg_name
  resource_group_name               = var.rg_name
  location                          = var.region
  account_kind                      = var.account_kind
  account_replication_type          = var.replication_type
  account_tier                      = var.account_tier
  enable_https_traffic_only         = var.https_traffic_only
  infrastructure_encryption_enabled = var.infra_encryption_enabled
  is_hns_enabled                    = var.hns_enabled
  allow_nested_items_to_be_public   = var.public_nested_items
  min_tls_version                   = var.min_tls_version
  shared_access_key_enabled         = var.shared_access_key_enabled
  nfsv3_enabled                     = var.nfsv3_enabled
  cross_tenant_replication_enabled  = var.cross_tenant_replication_enabled
  access_tier                       = var.access_tier
  tags                              = var.vpt_tags

  routing {
    publish_internet_endpoints  = var.publish_internet_endpoints
    publish_microsoft_endpoints = var.publish_microsoft_endpoints
    choice                      = var.routing_choice
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [var.cmk_identity_id]
  }

  customer_managed_key {
    key_vault_key_id          = var.cmk_key_id
    user_assigned_identity_id = var.cmk_identity_id
  }
}

resource "azurerm_storage_account_network_rules" "network_rules" {
  storage_account_id         = azurerm_storage_account.storage.id
  default_action             = var.sanr_default_action
  ip_rules                   = var.blob_ip_rules
  virtual_network_subnet_ids = var.allowed_subnets
}


module "vpstorage_pe" {
  for_each = var.pe_config
  source                = "../privateendpoint"
  pe_name               = each.value.name
  region                = var.region
  rg_name               = var.rg_name
  snet_id               = each.value.snet_id
  psc_pe_to_stg_name    = each.value.psc_name
  psc_resource_id       = azurerm_storage_account.storage.id
  pe_sub_resource_names = [each.value.sub_resource]
  pdnszg_ids            = [each.value.pdnszg_id]
  vpt_tags              = var.vpt_tags
}

resource "azurerm_advanced_threat_protection" "storage_protection" {
  target_resource_id = azurerm_storage_account.storage.id
  enabled            = var.enable_advanced_threat_protection
}
