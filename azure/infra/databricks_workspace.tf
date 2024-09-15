resource "azurerm_databricks_workspace" "databricks_sandbox_workspace" {
  name                = "Databricks-sandbox"
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
  location            = data.azurerm_resource_group.rg_databricks.location
  sku                 = "premium"
}