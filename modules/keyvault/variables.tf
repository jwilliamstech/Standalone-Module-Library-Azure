variable "kv_name" {
  type = string
}
variable "region" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "disk_encryption_enabled" {
  type    = bool
  default = false
}
variable "soft_delete_retention_days" {
  type    = number
  default = 90
}
variable "enabled_for_template_deployment" {
  type    = bool
  default = false
}
variable "enabled_for_deployment" {
  type    = bool
  default = false
}
variable "purge_protection_enabled" {
  type    = bool
  default = true
}
variable "sku_name" {
  type = string
  default = "standard"
}
variable "enable_kv_rbac" {
  type = bool
  default = true
}
variable "vpt_tags" {
  type = map(any)
  default = {
    Customer      = "Viewpointe"
    Purpose       = "Project Development"
    Environment   = "Development"
    Suite         = "Project"
    Requestor     = "Cloud Services"
    Owner         = "Cloud Services"    
  }
}
variable "nacls_def_action" {
  type = string
  default = "Deny"
}
variable "nacls_bypass" {
  type = string
  default = "AzureServices"
}
variable "snet_ids" {
  type = list(any)
}
variable "kv_ip_rules" {
  type = list(any)
  default = [ "23.117.0.0" ]
}
variable "pe_name" {
  type = string
}
variable "private_endpoint_snet_id" {
  type = string
}
variable "psc_kv_name" {
  type = string
}
variable "pe_sub_resource" {
  type = string
  default = "vault"
}
variable "pdnszg_id" {
  type = string
}
