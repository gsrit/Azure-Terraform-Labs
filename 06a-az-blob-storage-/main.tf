resource "random_pet" "rg-name" {
   length = 3
   separator = "--"
   prefix = "azlab"
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

#prefix    = var.resource_group_name_prefix

