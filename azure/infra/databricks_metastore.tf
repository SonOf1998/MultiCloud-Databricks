resource "azurerm_storage_account" "databricks_storage_account" {
  name                     = "databrickssandboxsa"
  resource_group_name      = data.azurerm_resource_group.rg_databricks.name
  location                 = data.azurerm_resource_group.rg_databricks.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true" # hierarchical namespace is a requirement for ADLS Gen2
}

resource "azurerm_storage_container" "main_metastore_storage_container" {
  name                  = "unity-catalog-storage"
  storage_account_name  = azurerm_storage_account.databricks_storage_account.name
  container_access_type = "private"
}

resource "databricks_metastore" "main_metastore" {
  name          = "primary"
  region        = local.region
  force_destroy = true

  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
    azurerm_storage_container.main_metastore_storage_container.name,
    azurerm_storage_account.databricks_storage_account.name
  )
}

resource "databricks_metastore_assignment" "this" {
  metastore_id = databricks_metastore.main_metastore.metastore_id
  workspace_id = azurerm_databricks_workspace.databricks_sandbox_workspace.workspace_id
}