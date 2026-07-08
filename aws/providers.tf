provider "aws" {
  region = local.region
}

# Account mode
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.databricks_terraform_client_id
  client_secret = var.databricks_terraform_client_secret
}