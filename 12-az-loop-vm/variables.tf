variable "vm_name" {
description         = "Name of the VM."
type                = list(string)
default             = [ "labvmtesta ", "labvmtestb" ]
}

variable "location" {
description         = "Region to build into"
default             = "southindia"
}