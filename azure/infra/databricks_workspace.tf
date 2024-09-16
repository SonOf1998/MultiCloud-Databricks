resource "azurerm_databricks_workspace" "databricks_sandbox_workspace" {
  name                = "Databricks-sandbox"
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
  location            = data.azurerm_resource_group.rg_databricks.location
  sku                 = "premium"
}

resource "databricks_mws_permission_assignment" "sandbox_admin_account_group_workspace_assignment" {
  workspace_id = azurerm_databricks_workspace.databricks_sandbox_workspace.workspace_id
  principal_id = data.databricks_group.sandbox_admin_account_group.id
  permissions  = ["ADMIN"]
}