variable "vm_name" {
description         = "Name of the VM."
type                = list(string)
default             = ["labvmtesta", "labvmtestb" ,"labvmtestc" ,"labvmtestc" ,"labvmtestc"]
}

variable "location" {
description         = "Region to build into"
default             = "southindia"
}