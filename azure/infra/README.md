# Initial setup
- Login to Azure Portal.
- In Microsoft Entra ID find `App registrations` and create an Application `Terraform`.
- On the application's page create a new Client secret using `Certificates & secrets`.
- Save `Application (client) ID`, `Directory (tenant) ID`, and the value field of the client secret as a GitHub secret.
- Enter your subscription and choose `IAM`. Store the `Subscription ID` as a Github secret as well.
- Assign the **Owner** role to **Terraform**.
- Create a resource group and a storage account for `.tfstate` files. Use them in `backend.tf`. 
