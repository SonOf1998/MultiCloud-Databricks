terraform {
  backend "s3" {
    bucket       = "mkisdbxtfstate"
    key          = "sandbox/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}