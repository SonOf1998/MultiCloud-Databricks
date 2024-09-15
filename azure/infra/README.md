# Initial setup
- Login to Azure Portal
- In Microsoft Entra ID find `App registrations` and create an Application `Terraform`
- On the application's page create a new Client secret using `Certificates & secrets`
- Save `Application (client) ID`, `Directory (tenant) ID`, and the value field of the client secret as a GitHub secret
- Enter your subscription and choose `IAM`
- Assign the **Owner** role to **Terraform**
