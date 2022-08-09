resource "azurerm_resource_group" "app" {
name = "UKS-PRD-RSG-BLG-APP"
location = var.location
tags {
Environment = "Production"
Buildby = "Gaurav Singh"
Builddate = "20220611"
Bugetcode = "Blog"
}
}

resource "azurerm_resource group" "net"{
name = "UKS-PRD-RSG-BLG-VNET"
location= var. location
tags = {
Environment = "Production"
Buildby = "Gaurav Singh"
Builddate = "20220611"
Bugetcode = "Blog"
}
}