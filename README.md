Azure Hub-spoke network topology Terraform module



https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke?tabs=cli


## Module Usage

```hcl

provider "azurerm" {
  features {}
}


module "hubandspoke" {

#### GLOBAL RESOURCES ####
   tags = {"Responsável" = "Wiliam de Campos", "Projeto" = "hub and spoke"}
   location = "EastUS"

#### HUB RESOURCES ###

   source = "./Modules/hubandspoke"
   resource-group-hub = "rg-prod-hub"
   namevnet-hub = "vnet-hub-prod"
   address_space_vnet-hub = ["10.0.0.0/16"]
   namesubnetgateway-hub = "GatewaySubnet"
   address_space_subnetgateway-hub = ["10.0.255.224/27"]
   namesubnetprod-hub = "subnet-prod"
   address_space_subnetprod-hub = ["10.0.1.0/24"]
   nsg-name-hub = "nsg-subnet-prod"

 #### SPOKE RESOURCES ####

   resource-group-spoke = "rg-prod-spoke01"
   namevnet-spoke = "vnet-spoke-prod"
   address_space_spoke1_vnet-spoke = ["10.1.0.0/16"]
   subnet-mgmt-spoke = "subnet-mgmt"
   address_space_subnet_mgmt-spoke = ["10.1.0.0/24"]
   subnet-workload-spoke = "subnet-workload"
   address_space_subnet_workload-spoke = ["10.1.1.0/24"]
   nsg-name-spoke = "nsg-spoke1-workload"

}
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.
