terraform {
  backend "azurerm" {
    resource_group_name  = "Databricks-sandbox"
    storage_account_name = "databrickssandboxtfstate"
    container_name       = "infra-tfstate"
    key                  = "sandbox.terraform.tfstate"

    subscription_id = var.subscription_id
    client_id       = var.application_client_id
    client_secret   = var.client_secret
    tenant_id       = var.directory_tenant_id
  }
}