provider "aws" {
  default_tags {
    tags = {
      Environment = "TheFactory"
      Managedby   = "Terraform"
    }
  }
}
