provider "azurerm" {
  features {}
}

# Account mode
provider "databricks" {
  host          = "https://accounts.azuredatabricks.net"
  account_id    = "6286ca48-3a1d-415b-942e-83431849de8b"
  client_id     = var.databricks_terraform_client_id
  client_secret = var.databricks_terraform_client_secret
  auth_type     = "oauth-m2m"
}

# Workspace mode
provider "databricks" {
  alias = "workspace"

  host          = azurerm_databricks_workspace.databricks_sandbox_workspace.workspace_url
  client_id     = var.databricks_terraform_client_id
  client_secret = var.databricks_terraform_client_secret
  auth_type     = "oauth-m2m"
}
