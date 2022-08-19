# Creating an AKS Cluster with Container Monitoring enabled using Azure Terraform

**This module creates a 3 node Linux AKS Cluster**

> Note 1: This deployment is not free. If you are not on a free trail, it will incur a very small fee. So, its always a good practice to cleanup everything when you are done with the demo.

> Note 2: We are creating a public IP address and attaching it to the AKS Cluster Load balancer.
## Resources in this module

- A Resource Group
- A Virtual network with a Subnet
- A Network Security Group
- Subnet and NSG Association
- A Public IP Address
- AKS Cluster
- Route Tabels
- Log Analytics Workspace
- Container Monitoring Solution for Log Analytics

> Notice that in this module, we are using a **Sufix** variable. We can use it to append to all resources for names.

> Note 1 - This output the cluster key, certificate and the passwords 

## Prerequisites

Initial Setup


########################################################################################################################

# Terraform Beginners Track - Microsoft Azure

## Prerequisites

- Any Code Editor (Visual Studio Code or Atom etc) 
- Microsoft Azure Subscription. 
- Hashicorp Terraform installed and added to the PATH
- A Service Principal is created and given **Contributor** access

## Terraform

### Write the code

Write the terraform code to deploy a virtual network.

- main.tf - This file contains provider and resource blocks
- variables.tf - This file contains all the variables
- outputs.tf - This file contains the outputs that will be displayed in the console if the deployment is successful.

Note: These are the standard file names in terraform. You can use any name for a .tf file. Ex: vnet.tf, vars.tf etc.

> You can add the Service principal variables in **terraform.tfvars** file in the format shown below.

*client_id  = "CLIENTID-OF-THE-APP"\
client_secret  = "CLIENT-SECRET-OF-THE-APP"\
subscription_id  = "SUBSCRIPTIONID"\
tenant_id  = "TENANTID"*

**This is not a best practice. If you choose to do this, YOU MUST NOT CHECK THIS FILE INTO VERSION CONTROL. 
I would suggest you to add these as Environment variables. You can refer the terraform-azure authentication process documentation [here](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html)**

> You can also provide these credentials at the run time or you can supply the variables for terraform plan and terraform apply

- *$ terraform plan -var "client_id=CLIENT_ID" -var "client_secret=CLIENT_SECRET" -var "subscription_id=SUBSCRIPTION_ID" -var "tenant_id=TENANT_ID"

### Run the terraform commands shown below 


- *$ terraform init*
- *$ terraform validate*
- *$ terraform plan -out=vnet.tfplan*
- *$ terraform apply vnet.tfplan* 

> You have to manually type 'yes' to deploy the infrastructure. You can skip the manual intervention with the command **"terraform apply -auto-approve"**

Once the deployment is done and you have verified the resources in the azure portal, cleanup everything with below command.

- $ terraform destroy

> Again, you have to manually type 'yes' to destroy the infrastructure. You can skip the manual intervention with the command **"terraform destroy -auto-approve"**



########################################################################################################################




## Steps

- *$ cd beginners/azure/aks_cluster* 

> Make sure you are in this directory. This is the directory from where we run terraform commands.

## After the deployment

- Once the deployment is successful, you can use **az login** to authenticate to subscription and use **az aks get-credentials** command with proper parameters to download the cluster credentials.

- Cleanup everything with **$ terraform destroy -auto-approve**