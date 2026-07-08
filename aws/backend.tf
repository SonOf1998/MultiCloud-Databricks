terraform {
  backend "s3" {
    bucket         = "mkisdbxtfstate"
    key            = "sandbox/terraform.tfstate"
    region         = local.region
    dynamodb_table = "mkisdbxtfstate-locks" # LockID as partition key
  }
}