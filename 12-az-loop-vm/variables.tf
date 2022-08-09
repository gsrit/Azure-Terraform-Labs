variable "vm_name" {
description         = "Name of the VM."
type                = list(string)
default             = [ "BlogVMNode 1 ", "BlogVMNode2"]
}

variable "location" {
description         = "Region to build into"
default             = "UK South"
}