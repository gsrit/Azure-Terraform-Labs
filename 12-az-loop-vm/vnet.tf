resource "azurerm_virtual_network" "vnet"{
name = "UKS-VNET-BLG-PRD"
location = var.location
resource_group_name = azurerm_resource_group.net.name
address_space = ["10.0.0.0/16"]
tags = {
Environment     = "Production"
Buildby         = "Gaurav Singh"
Builddate       = "20220611"
Bugetcode       = "Blog"
}
}