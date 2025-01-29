data "terraform_remote_state" "bootstrap" {
  backend = "s3"
  config = {
    bucket = "techtest-terraform-state-$ACCOUNT_NUMBER-eu-west-2"
    key    = "techtest/$ACCOUNT_NUMBER/eu-west-2/bootstrap.tfstate"
    region = "eu-west-2"
  }
}
