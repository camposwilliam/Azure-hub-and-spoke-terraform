resource "azurerm_resource_group" "hub-vnet-rg" {
  name     = var.resource-group-hub
  location = var.location
  tags = var.tags
}

resource "azurerm_virtual_network" "hub-vnet" {
  name                = var.namevnet-hub
  location            = azurerm_resource_group.hub-vnet-rg.location
  resource_group_name = azurerm_resource_group.hub-vnet-rg.name
  address_space       = var.address_space_vnet-hub
}

resource "azurerm_subnet" "hub-gateway-subnet" {
  name                 = var.namesubnetgateway-hub
  resource_group_name  = azurerm_resource_group.hub-vnet-rg.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = var.address_space_subnetgateway-hub
}

resource "azurerm_subnet" "hub-prod-subnet" {
  name                 = var.namesubnetprod-hub
  resource_group_name  = azurerm_resource_group.hub-vnet-rg.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = var.address_space_subnetprod-hub
}

resource "azurerm_network_security_group" "nsg-prd" {
  name                = var.nsg-name-hub
  location            = azurerm_resource_group.hub-vnet-rg.location
  resource_group_name = azurerm_resource_group.hub-vnet-rg.name

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

resource "azurerm_subnet_network_security_group_association" "association-prd" {
  subnet_id                 = azurerm_subnet.hub-prod-subnet.id
  network_security_group_id = azurerm_network_security_group.nsg-prd.id
}

# Virtual Network Gateway
# resource "azurerm_public_ip" "hub-vpn-gateway1-pip" {
#   name                = "hub-vpn-gateway1-pip"
#   location            = azurerm_resource_group.hub-vnet-rg.location
#   resource_group_name = azurerm_resource_group.hub-vnet-rg.name

#   allocation_method = "Dynamic"
# }

# resource "azurerm_virtual_network_gateway" "hub-vnet-gateway" {
#   name                = "hub-vpn-gateway1"
#   location            = azurerm_resource_group.hub-vnet-rg.location
#   resource_group_name = azurerm_resource_group.hub-vnet-rg.name

#   type     = "Vpn"
#   vpn_type = "RouteBased"

#   active_active = false
#   enable_bgp    = false
#   sku           = "VpnGw1"

#   ip_configuration {
#     name                          = "vnetGatewayConfig"
#     public_ip_address_id          = azurerm_public_ip.hub-vpn-gateway1-pip.id
#     private_ip_address_allocation = "Dynamic"
#     subnet_id                     = azurerm_subnet.hub-gateway-subnet.id
#   }
#   depends_on = [azurerm_public_ip.hub-vpn-gateway1-pip]
# }