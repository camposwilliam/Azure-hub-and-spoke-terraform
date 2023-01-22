## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.39.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_local_network_gateway.localnetowork](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_network_security_group.nsg-prd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nsg-spoke1-workload](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.hub-vpn-gateway1-pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.hub-vnet-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.spoke1-vnet-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.hub-gateway-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.hub-prod-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.spoke1-mgmt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.spoke1-workload](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.association-prd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.association-workload](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.hub-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.spoke1-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_gateway.hub-vnet-gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.onpremise](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |
| [azurerm_virtual_network_peering.hub-spoke1-peer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke1-hub-peer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | n/a | `string` | n/a | yes |
| <a name="input_address_space_spoke1_vnet-spoke"></a> [address\_space\_spoke1\_vnet-spoke](#input\_address\_space\_spoke1\_vnet-spoke) | n/a | `list(any)` | n/a | yes |
| <a name="input_address_space_subnet_mgmt-spoke"></a> [address\_space\_subnet\_mgmt-spoke](#input\_address\_space\_subnet\_mgmt-spoke) | n/a | `list(any)` | n/a | yes |
| <a name="input_address_space_subnet_workload-spoke"></a> [address\_space\_subnet\_workload-spoke](#input\_address\_space\_subnet\_workload-spoke) | n/a | `list(any)` | n/a | yes |
| <a name="input_address_space_subnetgateway-hub"></a> [address\_space\_subnetgateway-hub](#input\_address\_space\_subnetgateway-hub) | n/a | `list(any)` | n/a | yes |
| <a name="input_address_space_subnetprod-hub"></a> [address\_space\_subnetprod-hub](#input\_address\_space\_subnetprod-hub) | n/a | `list(any)` | n/a | yes |
| <a name="input_address_space_vnet-hub"></a> [address\_space\_vnet-hub](#input\_address\_space\_vnet-hub) | n/a | `list(any)` | n/a | yes |
| <a name="input_connection-name"></a> [connection-name](#input\_connection-name) | n/a | `string` | n/a | yes |
| <a name="input_create-resources-spoke"></a> [create-resources-spoke](#input\_create-resources-spoke) | n/a | `bool` | `false` | no |
| <a name="input_create_public_ip_vpn"></a> [create\_public\_ip\_vpn](#input\_create\_public\_ip\_vpn) | n/a | `bool` | `false` | no |
| <a name="input_create_virtual_network_gateway"></a> [create\_virtual\_network\_gateway](#input\_create\_virtual\_network\_gateway) | n/a | `bool` | `false` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | n/a | `string` | n/a | yes |
| <a name="input_local-address-space"></a> [local-address-space](#input\_local-address-space) | n/a | `list(any)` | n/a | yes |
| <a name="input_local-gateway-address"></a> [local-gateway-address](#input\_local-gateway-address) | n/a | `string` | n/a | yes |
| <a name="input_local-network-gateway-nane"></a> [local-network-gateway-nane](#input\_local-network-gateway-nane) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_namesubnetgateway-hub"></a> [namesubnetgateway-hub](#input\_namesubnetgateway-hub) | n/a | `string` | n/a | yes |
| <a name="input_namesubnetprod-hub"></a> [namesubnetprod-hub](#input\_namesubnetprod-hub) | n/a | `string` | n/a | yes |
| <a name="input_namevnet-hub"></a> [namevnet-hub](#input\_namevnet-hub) | n/a | `string` | n/a | yes |
| <a name="input_namevnet-spoke"></a> [namevnet-spoke](#input\_namevnet-spoke) | n/a | `string` | n/a | yes |
| <a name="input_nsg-name-hub"></a> [nsg-name-hub](#input\_nsg-name-hub) | n/a | `string` | n/a | yes |
| <a name="input_nsg-name-spoke"></a> [nsg-name-spoke](#input\_nsg-name-spoke) | n/a | `string` | n/a | yes |
| <a name="input_public_ip_vpn_name"></a> [public\_ip\_vpn\_name](#input\_public\_ip\_vpn\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource-group-hub"></a> [resource-group-hub](#input\_resource-group-hub) | n/a | `string` | n/a | yes |
| <a name="input_resource-group-spoke"></a> [resource-group-spoke](#input\_resource-group-spoke) | n/a | `string` | n/a | yes |
| <a name="input_shared-key-connection"></a> [shared-key-connection](#input\_shared-key-connection) | n/a | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | n/a | `string` | n/a | yes |
| <a name="input_subnet-mgmt-spoke"></a> [subnet-mgmt-spoke](#input\_subnet-mgmt-spoke) | n/a | `string` | n/a | yes |
| <a name="input_subnet-workload-spoke"></a> [subnet-workload-spoke](#input\_subnet-workload-spoke) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | n/a | yes |
| <a name="input_type-connection"></a> [type-connection](#input\_type-connection) | n/a | `string` | n/a | yes |
| <a name="input_use-remote-gateways"></a> [use-remote-gateways](#input\_use-remote-gateways) | n/a | `string` | n/a | yes |
| <a name="input_virtual_network_gateway_name"></a> [virtual\_network\_gateway\_name](#input\_virtual\_network\_gateway\_name) | n/a | `string` | n/a | yes |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
