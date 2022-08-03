resource "azurerm_resource_group" "tf-example" {
    name = "${var.base_name}-RG"
    location = var.location
}