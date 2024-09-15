terraform {
  backend "azurerm" {
    resource_group_name  = "Databricks-sandbox"
    storage_account_name = "databrickssandboxtfstate"
    container_name       = "infra-tfstate"
    key                  = "sandbox.terraform.tfstate"

    # client_secret is populated by setting ARM_CLIENT_SECRET through GitHub action
    subscription_id = local.subscription_id
    client_id       = local.application_client_id
    tenant_id       = local.directory_tenant_id
  }
}