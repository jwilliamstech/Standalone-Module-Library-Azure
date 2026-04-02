
**Usage:**
```
module "cg3_storage" {
  source                = "../buildtools/tf/modules/storage"
  stg_name              = "myuniquename"
  rg_name               = "resourcegroupname"
  region                = "region"
  cmk_key_id            = "id_of_key_to be_used_fcustomer_managed_key"
  cmk_identity_id       = "id_of_identity_with_access_to_cmk_key"
  allowed_subnets       = ["snet_id_1","snet_id_2"]
  blob_ip_rules         = ["ip_rules_for_fierewall_exception"]
  pe_config             = {
    "pe1" = {
      name          = "mypename1"
      snet_id       = local.snet_id
      psc_name      = "${local.psc_stg_name}2"
      sub_resource  = "blob"
      pdnszg_id     = local.pdsn_blob_id
    }
  }
}

variable "stg_pes" {
  type = map
  default = {
    "pe1" = {
      name = "mypename1"
      psc_name = "myprivateserviceconnectionname1"
      sub_resource = "blob"
      pdnszg_id = var.private_dns_zone_id
    }
  }
}

```

**Required:**  
`stg_name`         - The name of the storage account  
`rg_name`          - The name of the resource group  
`region`           - The region for the storage account  
`cmk_identity_id`  - The ID for the customer managed key.  Note that this ID should have the right access to the key in the key vault.  
`cmk_key_id`       - The ID for the key to be used in CMK  
`vpt_tags`         - Map of tags to apply to the resource.
`allowed_subnets`  - List of subnets to allow in the network for this resource  
`blob_ip_rules`    - List of IPs to place in firewall exception  
`pe_config`        - (Map)  with the following:  
- `name`       : Name of private endpoint  
- `snet_id`    : The ID of the subnet for this endpoint  
- `psc_name`   : String with name for the service connection  
- `pdnszg_id`  : The ID of the private DNS Zone  

**Optional:**  
`account_kind`                      - Kind of account.   
Default: `StorageV2`  

`account_tier`                      - Account Tier.  
Default: `Standard`  

`enable_https_traffic_only`         - Boolean, Forces https if enabled  
Default: `true`  

`infrastructure_encryption_enabled` - Enable infra encryption.  
Default `true`  

`is_hns_enabled`                    - Enable heirarchichal name  
Default: `true`  


`blob_ip_rules`                     - List of IP addresses for firewall exception (list)

`cross_tenant_replication_enabled`  - Allow cross tenant replication.
Default: `true`

`access_tier`                       - Access Tier
Default: `Hot`

`allow_nested_items_to_be_public`   - Allow public access
Default: `false`

`min_tls_version`                   - Minimum supported TLS version for storage.
Default: `TLS1_2`

`shared_access_key_enabled`         - Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD).
Default: `true`

`public_network_access_enabled`     - Enable public network access
Default: `false`

`default_to_oauth_authentication`   - Default to AD authorization in the Azure portal when accessing the account
Default: `true`
nfsv3_enabled                       - NFSv3 protocol enabled?
Default: `false`

`tags` (map)                              - Map of tags

**Networking**

`routing_choice`                    - Options `InternetRouting` and `MicrosoftRouting`  
Default: `MicrosoftRouting`  
`publish_internet_endpoints`        - publish_microsoft_endpoints  
Default:`false`  
       -


Questions:  
edge_zone:  
custom_domain - Not sure if we want to do this.  
delete_retention_policy - appears that not supported by block?  
container_delete_retention_policy  
hour_metrics - block but not sure  
