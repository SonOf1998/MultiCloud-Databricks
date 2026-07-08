# Initial setup - Terraform
- Login to AWS Console.
- Create an IAM role for Terraform.
- Define the trust policy below

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"Federated": "arn:aws:iam::233231935653:oidc-provider/token.actions.githubusercontent.com"
			},
			"Action": "sts:AssumeRoleWithWebIdentity",
			"Condition": {
				"StringEquals": {
					"token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
				},
				"StringLike": {
		          "token.actions.githubusercontent.com:sub": "repo:SonfOf1998/MultiCloud-Databricks:*"
		        }
			}
		}
	]
}
```

- Assign AdministratorAccess to the role, name it as `Terraform`.
- In IAM/IdentityProviders add a new OpenID provider with url `https://token.actions.githubusercontent.com` and audience `sts.amazonaws.com`

# Initial setup - Databricks
- Visit https://accounts.cloud.databricks.com/
- Register and create a new service principal under `User management` called **Terraform**. 
- Grant admin access to the service principal.
- As Terraform has low capabilities when it comes to the Databricks account, many activities are required to be done manually 
(Metastore admin group creation, enabling serverless for Notebooks, Jobs and DLTs etc.). 
- Create a token pair for Terraform and upload it as **GitHub secret**s: `AWS_DATABRICKS_CLIENT_ID`, `AWS_DATABRICKS_CLIENT_SECRET`.

