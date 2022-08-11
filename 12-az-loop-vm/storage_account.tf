resource "azurerm_storage_account" "storage" {
name                        = "diagblogvmnode"
resource_group_name         = azurerm_resource_group.app.name
location                    = var.location
account_tier                = "Standard"
account_replication_type    = "LRS"

tags = {
Environment     = "Production"
Buildby         = "Gaurav Singh"
Builddate       = "20220611"
Bugetcode       = "TF-LAB"
}
}