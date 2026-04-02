locals {
  nic_name      = "nic${var.vm_name}"
  nsg_name      = "nsg-${var.vm_name}"
  stg_diag_name = "diag${var.vm_name}"
  md_name       = "md${var.vm_name}"
  computer_name = var.computer_name == "" ? var.vm_name : var.computer_name
}