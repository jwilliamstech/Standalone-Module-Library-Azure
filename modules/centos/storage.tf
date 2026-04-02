
module "diag_storage" {
  source          = "../storage"
  stg_name        = local.stg_diag_name
  rg_name         = var.rg_name
  region          = var.region
  cmk_key_id      = var.cmk_key_id
  cmk_identity_id = var.cmk_identity_id
  allowed_subnets = [var.snet_id]
  pe_config = {
    "pe1" = {
      name         = "pe${local.stg_diag_name}"
      snet_id      = var.snet_id
      psc_name     = "pscpe${local.stg_diag_name}"
      sub_resource = "blob"
      pdnszg_id    = var.pdnszg_id
    }
  }
}
