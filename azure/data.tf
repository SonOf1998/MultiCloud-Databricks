data "azurerm_resource_group" "rg_databricks" {
  name = "Databricks-sandbox"
}

data "databricks_group" "sandbox_admin_account_group" {
  display_name = local.sandbox_admin_account_group
}