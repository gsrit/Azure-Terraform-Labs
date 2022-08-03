 module "ResourceGroup" {
   source = "./ResourceGroup"
   base_name = "terra-lab22"
   location = "southindia"
 }


 module "StorageAccount" {
   source = "./StorageAccount"
   base_name = "TerraformExample01"
   resource_group_name = module.ResourceGroup.rg_name_output
   location = "southindia"
 }

