
resource "azurerm_private_endpoint" "vp_pe" {
  name                = var.pe_name
  location            = var.region
  resource_group_name = var.rg_name
  subnet_id           = var.snet_id
  tags                = var.vpt_tags
  private_service_connection {
    name                           = var.psc_pe_to_stg_name
    private_connection_resource_id = var.psc_resource_id
    subresource_names              = var.pe_sub_resource_names
    is_manual_connection           = var.is_manual_connection
  }
  private_dns_zone_group {
    name                 = var.pdnszg_name
    private_dns_zone_ids = var.pdnszg_ids
  }
}