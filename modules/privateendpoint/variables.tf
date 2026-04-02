
variable "pe_name" {
    type = string 
}
variable "region" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "snet_id" {
  type = string
}
variable "pe_sub_resource_names" {
  type = list
}
variable "pdnszg_name" {
  type = string
  default = "default"
}
variable "psc_pe_to_stg_name" {
  type = string
}
variable "psc_resource_id" {
  type = string
}
variable "pdnszg_ids" {
  type = list
}
variable "vpt_tags" {
  type = map
}
variable "is_manual_connection" {
  type = bool
  default = false
}