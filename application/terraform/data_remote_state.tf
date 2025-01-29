data "terraform_remote_state" "account" {
  backend = "s3"
  config = {
    bucket = "techtest-terraform-state-$ACCOUNT_NUMBER-eu-west-2"
    key    = "techtest/$ACCOUNT_NUMBER/eu-west-2/account.tfstate"
    region = "eu-west-2"
  }
}
