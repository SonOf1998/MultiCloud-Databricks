terraform {
  backend "s3" {
    bucket         = "mkisdbxtfstate"
    key            = "sandbox/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "mkisdbxtfstate-locks" # LockID as partition key
  }
}