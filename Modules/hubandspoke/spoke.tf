resource "azurerm_resource_group" "spoke1-vnet-rg" {
  name     = var.resource-group-spoke
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "spoke1-vnet" {
  name                = var.namevnet-spoke
  location            = azurerm_resource_group.spoke1-vnet-rg.location
  resource_group_name = azurerm_resource_group.spoke1-vnet-rg.name
  address_space       = var.address_space_spoke1_vnet-spoke
}

resource "azurerm_subnet" "spoke1-mgmt" {
  name                 = var.subnet-mgmt-spoke
  resource_group_name  = azurerm_resource_group.spoke1-vnet-rg.name
  virtual_network_name = azurerm_virtual_network.spoke1-vnet.name
  address_prefixes     = var.address_space_subnet_mgmt-spoke
}

resource "azurerm_subnet" "spoke1-workload" {
  name                 = var.subnet-workload-spoke
  resource_group_name  = azurerm_resource_group.spoke1-vnet-rg.name
  virtual_network_name = azurerm_virtual_network.spoke1-vnet.name
  address_prefixes     = var.address_space_subnet_workload-spoke
}

resource "azurerm_network_security_group" "nsg-spoke1-workload" {
  name                = var.nsg-name-spoke
  location            = azurerm_resource_group.spoke1-vnet-rg.location
  resource_group_name = azurerm_resource_group.spoke1-vnet-rg.name

  # security_rule {
  #   name                       = "test123"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }
}

resource "azurerm_subnet_network_security_group_association" "association-workload" {
  subnet_id                 = azurerm_subnet.spoke1-workload.id
  network_security_group_id = azurerm_network_security_group.nsg-spoke1-workload.id
}

resource "azurerm_virtual_network_peering" "spoke1-hub-peer" {
  name                      = "spoke-hub-peer"
  resource_group_name       = azurerm_resource_group.spoke1-vnet-rg.name
  virtual_network_name      = azurerm_virtual_network.spoke1-vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub-vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = var.use-remote-gateways
  depends_on                   = [azurerm_virtual_network.spoke1-vnet, azurerm_virtual_network.hub-vnet]
}


resource "azurerm_virtual_network_peering" "hub-spoke1-peer" {
  name                         = "hub-spoke-peer"
  resource_group_name          = azurerm_resource_group.hub-vnet-rg.name
  virtual_network_name         = azurerm_virtual_network.hub-vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke1-vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.spoke1-vnet, azurerm_virtual_network.hub-vnet]
}
