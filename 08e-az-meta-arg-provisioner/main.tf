




resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = file("~/.ssh/id_rsa.pub")
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Terraform Demo"
    }
	    
	connection {
        host = self.public_ip_address
        user = "azureuser"
        type = "ssh"
        private_key = "${file("~/.ssh/id_rsa")}"
        timeout = "4m"
        agent = false
    }
	
	provisioner "file" {
        source = "example_file.txt"
        destination = "/tmp/example_file.txt"
    }

    provisioner "remote-exec" {
        inline = [
          "sudo apt-get update",
          "sudo apt-get install docker.io -y",
          "git clone https://github.com/devopsschool-training-notes/terraform-ey-june-2021",
          "sudo docker run -d -p 80:80 httpd"
        ]
    }
	
	provisioner "local-exec" {
    command = "deploy.bat"
	}
}