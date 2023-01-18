terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "hubandspoke" {

  #### GLOBAL RESOURCES ####
  tags     = { "Responsável" = "Wiliam de Campos", "Projeto" = "hub and spoke" }
  location = "EastUS"

  #### HUB RESOURCES ###

  source                          = "./Modules/hubandspoke"
  resource-group-hub              = "rg-prod-hub"
  namevnet-hub                    = "vnet-hub-prod"
  address_space_vnet-hub          = ["10.0.0.0/16"]
  namesubnetgateway-hub           = "GatewaySubnet"
  address_space_subnetgateway-hub = ["10.0.255.224/27"]
  namesubnetprod-hub              = "subnet-prod"
  address_space_subnetprod-hub    = ["10.0.1.0/24"]
  nsg-name-hub                    = "nsg-subnet-prod"

  #### SPOKE RESOURCES ####

  resource-group-spoke                = "rg-prod-spoke01"
  namevnet-spoke                      = "vnet-spoke-prod"
  address_space_spoke1_vnet-spoke     = ["10.1.0.0/16"]
  subnet-mgmt-spoke                   = "subnet-mgmt"
  address_space_subnet_mgmt-spoke     = ["10.1.0.0/24"]
  subnet-workload-spoke               = "subnet-workload"
  address_space_subnet_workload-spoke = ["10.1.1.0/24"]
  nsg-name-spoke                      = "nsg-spoke1-workload"
  use-remote-gateways = false

  ### VRITUAL NETWORK GATEWAY ####

  create_virtual_network_gateway = true
  create_public_ip_vpn           = true

  public_ip_vpn_name           = "hub-vpn-gateway1-pip"
  virtual_network_gateway_name = "hub-vpn-gateway1"
  type                         = "Vpn"
  vpn_type                     = "RouteBased"
  active_active                = false
  enable_bgp                   = false
  sku                          = "VpnGw1"

  ### LOCAL NETWORK GATEWAY ####


  local-network-gateway-nane = "datacenter01"
  local-gateway-address = "168.62.225.23"
  local-address-space = ["10.99.1.0/24"]

  ### CONNECTION  ####

  connection-name = "connection01"
  type-connection = "IPsec"
  shared-key-connection = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"

}
