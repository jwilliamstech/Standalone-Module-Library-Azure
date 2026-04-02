
#Usage:  
```
module "admin_kv" {
  source                   = "../buildtools/tf/modules/keyvault"
  kv_name                  = local.kv_name
  region                   = var.region
  rg_name                  = local.rg_name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  snet_ids                 = [data.terraform_remote_state.vnet.outputs.subnet_id_dev]
  private_endpoint_snet_id = data.terraform_remote_state.vnet.outputs.subnet_id_dev
  kv_ip_rules              = [var.kv_ip_rules]
  pe_name                  = "pe${local.kv_name}"
  psc_kv_name              = "psc${local.kv_name}"
  pe_sub_resource          = "vault"
  pdnszg_id                = data.terraform_remote_state.vnet.outputs.pdns_kv_id
}

```

`name`                        - Name of key vault  

`location`                    - The region where we deploy the key vault  

`rg_name`                     - Name of resource group where this will live  

`tenant_id`                   - The ID of the tenant where this gets deployed  

`snet_ids`                    - List of subnets that should have access to this key vault  

`private_endpoint_snet_id`    - ID of the subnet where the private endpoint will be placed  

`kv_ip_rules`                 - List of IP rules for firewall exception to the private network.  

`pe_name`                     - The name for the private endpoint  

`psc_kv_name`                 - The name for the private service connection (Private endpoint / keyvault)

`soft_delete_retention_days`  - Number of days that items should be retained once soft deleted  (number)  
Default: `7`  

`purge_protection_enabled`    - Is Purge Protection enabled for this Key Vault? (bool)  
Default: `false`  

`sku_name`                    - Name of SKU used for this Key Vault possible values: `standard` and `premium`  
Default: `standard`  

`enable_kv_rbac`              - Boolean to determine if RBAC should be enabled  
Default: `true`  

`disk_encryption_enabled`     - Boolean flag to specify if Azure Resource Manager is permitted to retreive secrets from the ky vault.  
Default: `false`

`enabled_for_deployment`      - Enabled for deployment  
Default: `false`  

`enabled_for_template_deployment` - Boolean to determine if key vault is enabled for template deployment.  
Default: `false`  

`tags`                        - Map of tags to be applied  

`nacls_bypass`                - Which traffic can bypass the network rules.  Possible: `AzureServices` and `None`  
Default: `AzureServices`  

`nacls_default_action`           - Default action to take when no rules match from `ip_rules`.  Possible `Allow` and `Deny`
Default: `Deny`
