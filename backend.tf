terraform {
  required_version = ">= 1.5.1"

  backend "s3" {
    region         = "eu-west-1"
    bucket         = "tf-backend-ct-controls-785672774069"
    key            = "eu-west-1/ct-controls/terraform.tfstate"
    dynamodb_table = "tf-backend-ct-controls-785672774069"
    encrypt        = "true"
    kms_key_id     = "arn:aws:kms:eu-west-1:785672774069:key/291297d6-1566-4f9d-b287-a95b8ab52e32"
  }
}