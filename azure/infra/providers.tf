provider "azurerm" {
  features {}

  subscription_id = local.terraform_subscription_id
  client_id       = local.terraform_application_client_id
  client_secret   = var.terraform_client_secret
  tenant_id       = local.terraform_directory_tenant_id
}