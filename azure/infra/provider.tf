provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.application_client_id
  client_secret   = var.client_secret
  tenant_id       = var.directory_tenant_id
}