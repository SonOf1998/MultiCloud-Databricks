#!/bin/bash

TERRAFORM_VERSION="1.15.7"
DATABRICKS_CLI_VERSION="1.6.0"

# Detect Architecture (amd64 for Intel, arm64 for Apple Silicon)
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    TF_ARCH="amd64"
    DB_ARCH="amd64"
else
    TF_ARCH="arm64"
    DB_ARCH="arm64"
fi

echo "Downloading tools for macOS-$ARCH..."

# 1. Install Terraform
echo "Installing Terraform ${TERRAFORM_VERSION}..."
curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_darwin_${TF_ARCH}.zip"
unzip "terraform_${TERRAFORM_VERSION}_darwin_${TF_ARCH}.zip"
sudo mv terraform /usr/local/bin/
rm "terraform_${TERRAFORM_VERSION}_darwin_${TF_ARCH}.zip"

# 2. Install Databricks CLI
echo "Installing Databricks CLI ${DATABRICKS_CLI_VERSION}..."
curl -LO "https://github.com/databricks/cli/releases/download/v${DATABRICKS_CLI_VERSION}/databricks_cli_${DATABRICKS_CLI_VERSION}_darwin_${DB_ARCH}.zip"
unzip "databricks_cli_${DATABRICKS_CLI_VERSION}_darwin_${DB_ARCH}.zip" "databricks"
sudo mv databricks /usr/local/bin/
rm "databricks_cli_${DATABRICKS_CLI_VERSION}_darwin_${DB_ARCH}.zip"

echo "Installation complete!"
terraform --version
databricks --version