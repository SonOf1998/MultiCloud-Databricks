#!/bin/bash

# Designed for Ubuntu/Debian. 

# Install latest Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Install Databricks CLI 0.228.0
DATABRICKS_CLI_VERSION=0.228.0
wget https://github.com/databricks/cli/releases/download/v${DATABRICKS_CLI_VERSION}/databricks_cli_${DATABRICKS_CLI_VERSION}_linux_amd64.zip
unzip ./databricks_cli_${DATABRICKS_CLI_VERSION}_linux_amd64.zip
export PATH=$(pwd):$PATH