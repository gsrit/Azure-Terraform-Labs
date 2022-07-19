#https://docs.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli
#test2
resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

