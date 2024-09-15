terraform {
  backend "azurerm" {
    resource_group_name  = "Databricks-sandbox"
    storage_account_name = "databrickssandboxtfstate"
    container_name       = "infra-tfstate"
    key                  = "sandbox.terraform.tfstate"

    # When a terraform command stuck use 'Break lease' on the state file
  }
}