
variable "stg_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "region" {
  description = "Region for CG3"
  type        = string
}
variable "cmk_key_id" {
  type = string
}
variable "cmk_identity_id" {
  description = "Identity ID that has access to the key (in Key Vault) to be used as the Storage key"
  type = string 
}

variable "allowed_subnets" {
  type = list 
}

variable "pe_config" {
  type = map
}

variable "blob_ip_rules" {
  type = list
  default = ["127.0.0.1"]
}

variable "sanr_default_action" {
  type = string
  default = "Deny"
}

variable "enable_advanced_threat_protection" {
  type = bool
  default = false
}

variable "vpt_tags" {
  type = map
  default = {
    Customer      = "Viewpointe"
    Purpose       = "Project Development"
    Environment   = "Development"
    Suite         = "Project"
    Requestor     = "Cloud Services"
    Owner         = "Cloud Services"    
  }
}

#Defaults

variable "account_kind" {
  description = "Region for CG3"
  type        = string
  default = "StorageV2"
}

variable "replication_type" {
  description = "Region for CG3"
  type        = string
  default     = "GRS"
}

variable "account_tier" {
  description = "Region for CG3"
  type        = string
  default     = "Standard"
}

variable "https_traffic_only" {
  description = "Region for CG3"
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Region for CG3"
  type        = string
  default     = "TLS1_2"
}

variable "cross_tenant_replication_enabled" {
  description = "Cross tenant replication enabled"
  type        = bool
  default     = true
}

variable "access_tier" {
  description = "Access Tier"
  type        = string
  default     = "Hot"
}

variable "infra_encryption_enabled" {
  description = "Region for CG3"
  type        = bool
  default     = true
}

variable "hns_enabled" {
  description = "Region for CG3"
  type        = bool
  default     = false
}

variable "public_nested_items" {
  description = "Region for CG3"
  type        = bool
  default     = false
}

variable "shared_access_key_enabled" {
  description = "Region for CG3"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Allow public network access"
  type        = bool
  default     = false
}

variable "default_to_oauth_authentication" {
  description = "Default to AD authorization in the Azure portal when accessing the account"
  type        = bool
  default     = true
}

variable "nfsv3_enabled" {
  description = "Enable NFSv3 protocol"
  type        = bool
  default     = false
}

#Networking

variable "publish_internet_endpoints" {
  description = "Publish Internet Endpoints"
  type        = bool
  default     = false
}

variable "publish_microsoft_endpoints" {
  description = "Publish Microsoft Endpoints"
  type        = bool
  default     = false
}

variable "routing_choice" {
  description = "Region for CG3"
  type        = string
  default     = "MicrosoftRouting"
}

