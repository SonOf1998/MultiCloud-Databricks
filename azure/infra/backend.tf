terraform {
  backend "azurerm" {
    resource_group_name  = "Databricks-sandbox"
    storage_account_name = "databrickssandboxtfstate"
    container_name       = "infra-tfstate"
    key                  = "sandbox.terraform.tfstate"

    # backend resources do not allow variables and local variables
    # client_secret is populated by setting ARM_CLIENT_SECRET through GitHub action
    subscription_id = "80d12c9d-7af9-46e4-a6e6-fe840b811cde"
    client_id       = "62852b9b-0411-49a0-9df4-e9c90a51fd0d"
    tenant_id       = "658a8653-a3b4-4b42-8802-740ac3cb1daa"
  }
}