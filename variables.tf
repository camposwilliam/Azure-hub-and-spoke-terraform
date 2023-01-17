### VARIABLES RESOURCES HUB ###

variable "resource-group-hub" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "namevnet-hub" {
  type = string
}

variable "address_space_vnet-hub" {
  type = list(any)
}

variable "namesubnetgateway-hub" {
  type = string
}

variable "address_space_subnetgateway-hub" {
  type = list(any)
}

variable "namesubnetprod-hub" {
  type = string
}

variable "address_space_subnetprod-hub" {
  type = list(any)
}

variable "nsg-name-hub" {
  type = string
}

### VARIABLES RESOURCES SPOKE ###

variable "resource-group-spoke" {
  type = string
}

variable "namevnet-spoke" {
  type = string
}

variable "address_space_spoke1_vnet-spoke" {
  type = list(any)
}

variable "subnet-mgmt-spoke" {
  type = string
}

variable "address_space_subnet_mgmt-spoke" {
  type = list(any)
}

variable "subnet-workload-spoke" {
  type = string
}

variable "address_space_subnet_workload-spoke" {
  type = list(any)
}

variable "nsg-name-spoke" {
  type = string
}

variable "create_virtual_network_gateway" {
  type    = bool
  default = false
}

variable "create_public_ip_vpn" {
  type    = bool
  default = false
}


variable "virtual_network_gateway_name" {
  type = string
}


variable "type" {
  type = string
}

variable "vpn_type" {
  type = string
}

variable "active_active" {
  type    = bool
  default = false
}

variable "enable_bgp" {
  type    = bool
  default = false
}

variable "sku" {
  type = string
}

variable "public_ip_vpn_name" {
  type = string
}
