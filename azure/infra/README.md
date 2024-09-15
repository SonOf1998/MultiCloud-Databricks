# Initial setup - Terraform
- Login to Azure Portal.
- In Microsoft Entra ID find `App registrations` and create an Application `Terraform`.
- Save `Application (client) ID` and `Directory (tenant) ID` as **GitHub secret**s.
- On the application's page create a new Client secret using `Certificates & secrets`.
- Save the value field of the client secret as a **GitHub secret**.
- Enter your subscription and choose `IAM`.
- Save the `Subscription ID` as a **GitHub secret**.
- Assign the **Owner** role to **Terraform**.
- Create a resource group, a storage account and a container for `.tfstate` files. Use them in `backend.tf`. 
- Create `backend.tf`, `providers.tf` and `requirements.tf`.
- Check `terraform_plan_azure.yaml` to find how credentials are passed.

# Initial setup - Databricks
- In Microsoft Entra ID create a new user with Global Administrator rights.
- With this new account visit https://accounts.azuredatabricks.net/
- Create a new service principal under `User management` called **Terraform**. Specify the `Application (client) ID` from above.
- Grant admin access to the service principal.
- As Terraform has low capabilities when it comes to the Databricks account, many activities are required to be done manually 
(Metastore admin group creation, enabling serverless for Notebooks, Jobs and DLTs etc.). 

