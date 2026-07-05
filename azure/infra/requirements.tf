terraform {
  #required_version = "1.15.7"
  #version is provided through GitHub actions

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.120"
    }
  }
}
