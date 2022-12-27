### VARIABLES RESOURCES HUB ###

variable "resource-group-hub" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map
}

variable "namevnet-hub" {
  type = string
}

variable "address_space_vnet-hub" {
  type = list
}

variable "namesubnetgateway-hub" {
  type = string
}

variable "address_space_subnetgateway-hub" {
  type = list
}

variable "namesubnetprod-hub" {
  type = string
}

variable "address_space_subnetprod-hub" {
  type = list
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
  type = list
}

variable "subnet-mgmt-spoke" {
  type = string
}

variable "address_space_subnet_mgmt-spoke" {
  type = list
}

variable "subnet-workload-spoke" {
  type = string
}

variable "address_space_subnet_workload-spoke" {
  type = list
}

variable "nsg-name-spoke" {
  type = string
}