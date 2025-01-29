terraform {
  backend "s3" {
    region         = "eu-west-2"
    bucket         = "techtest-terraform-state-$ACCOUNT_NUMBER-eu-west-2"
    key            = "techtest/$ACCOUNT_NUMBER/eu-west-2/application.tfstate"
    dynamodb_table = "techtest-terraform-statelock"
  }
}
