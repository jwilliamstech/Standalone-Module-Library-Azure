
variable "rg_name" {
  type = string
}
variable "vm_name" {
  type = string
}

variable "region" {
  description = "Region for CG3"
  type        = string
  default = "southcentralus"
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_D2ds_v4"
}

# Disk information:
variable "vm_os_disk_caching" {
  description = ""
  type        = string
  default     = "ReadWrite"
}
variable "vm_os_disk_sat" {
  description = ""
  type        = string
  default     = "StandardSSD_LRS"
}

#Image Variables:
variable "centos_7_5_sku" {
  type        = string
  description = "SKU for Centos 7.5"
  default     = "7.5"
}

variable "centos_7_5_offer" {
  type        = string
  description = "Offer Centos 7.5"
  default     = "CentOS"
}

variable "centos_7_5_publisher" {
  type        = string
  description = "Publisher for Centos 7.5"
  default     = "OpenLogic"
}

variable "source_image" {
  type = map
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }
}

# Computer Administration
variable "computer_name" {
  type = string
  default = ""
}

variable "vm_admin_username" {
  description = "Username of Admin account"
  type        = string
  default     = "azureuser"
}

variable "disable_password_authentication" {
  type = bool
  default = true
}

variable "pub_key_location" {
  description = "The key for the admin user"
  type        = string
}

# Networking
variable "nic_ipc_name" {
  description = "The Name of the NIC IP Config"
  type        = string
  default     = "internal"
}
variable "snet_id" {
  description = "The ID of the current subnet"
  type        = string
}
variable "nic_ipc_pip_addr_alloc" {
  description = "Private IP address allocation type"
  type        = string
  default     = "Dynamic"
}

# Storage
variable "cmk_key_id" {
  type = string
}
variable "cmk_identity_id" {
  type = string
}
variable "pdnszg_id" {
  type = string
}


variable "common_tags" {
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

#***********************
#VM Variables Start here
#***********************




variable "nsg_security_rule" {
  type = map
  default = {
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
}

variable "vm_sir_publisher" {
  description = ""
  type        = string
  default     = "OpenLogic"
}

variable "vm_sir_offer" {
  description = ""
  type        = string
  default     = "CentOS"
}

variable "vm_sir_sku" {
  description = ""
  type        = string
  default     = "7.5"
}

variable "vm_sir_version" {
  description = ""
  type        = string
  default     = "latest"
}
# Disk
variable "md_sat" {
  description = "Managed Disk Storage Account Type"
  type        = string
  default     = "Premium_LRS"
}
variable "md_create_option" {
  description = "Managed Disk Create Option"
  type        = string
  default     = "Empty"
}
variable "md_disk_size_gb" {
  description = "Managed Disk Storage Account Type"
  type        = string
  default     = "128"
}
variable "avmdda_lun" {
  description = "Data Disk Attachment lun"
  type        = string
  default     = "01"
}
variable "avmdda_caching" {
  description = "Data Disk Attachment caching"
  type        = string
  default     = "ReadWrite"
}
