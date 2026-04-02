
resource "azurerm_network_interface" "thisnic" {
  name                = local.nic_name
  location            = var.region
  resource_group_name = var.rg_name
  ip_configuration {
    name                          = var.nic_ipc_name
    subnet_id                     = var.snet_id
    private_ip_address_allocation = var.nic_ipc_pip_addr_alloc
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
  name                = local.nsg_name
  location            = var.region
  resource_group_name = var.rg_name
  tags                = var.common_tags

  security_rule {
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

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.thisnic.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}
