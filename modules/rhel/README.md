
**Usage:  
```
module "rhel" {
  source            = "../buildtools/tf/modules/rhel"
  vm_name           = local.vm_name
  rg_name           = local.rg_name
  region            = var.region
  snet_id           = local.snet_id
  pub_key_location  = "./resources/ssh-ocsdev.pub"
  cmk_key_id        = azurerm_key_vault_key.cmk_key.id
  cmk_identity_id   = azurerm_user_assigned_identity.ocs_kv_identity.id
  pdnszg_id         = data.terraform_remote_state.vnet.outputs.pdns_blob_id
}
```  

**TO DO:**
- Public key and username need to be addressed.  Potentially with a dynamic public key that gets stored in the key vault
- Enhancement:
  - Add private endpoint to diagnostics storage account
- NSG Security Rule - Can't seem to substitute a variable so we may need to assign each value
  - Network Security Group:
    - default 
```
  nsg_security_rule = {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"    
  }
```

**Required:**
- rg_name             - Name of the Resource Group
- region              - Region where VM will be placed
- tli                 - Three letter identifier for customer
- region_short        - Short region name (sc, nc, etc..)
- solution            - Solution name (Project X, Solution Y, etc..)
- env                 - Environment (dev, qa, prod)
- vm_admin_username   - (Administrator username)
- vm_admin_public_key - (Location of public key relative to the code invoking the module)
- snet_id             - Subnet ID for the VM

**Optional:**

Virtual Machine:
- vm_size - Size of the virtual machine
  - Default: "Standard_D2ds_v4"
- vm_admin_username
  - Default: azureuser
- vm_os_disk_caching
  - Default: ReadWrite

Image Reference
- vm_sir_publisher
  - Default: "OpenLogic"
- vm_sir_offer            
  - Default: "CentOS"
- vm_sir_sku
  - Default: "7.5"
- vm_sir_version
  - Default: "latest"

- Managed Disk
- md_sat
  - "Premium_LRS"
- md_create_option
  - "Empty"
- md_disk_size_gb
  - "128"

Data Disk Attachment
- avmdda_lun
  - "01"
- avmdda_caching
  - "ReadWrite"

Network Interface:
- nic_ipc_name  - Name of Network interface
  - Default: `internal`
- nic_ipc_pip_addr_alloc - Private IP address allocation
  - Defaults: `Dynamic`

