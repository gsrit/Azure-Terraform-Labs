#https://docs.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli






resource "azurerm_resource_group" "rsg-prd001" {
  name      = "gslab-rsg001"
  location  = "southindia"
}


