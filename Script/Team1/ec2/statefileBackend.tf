terraform {
  backend "s3" {
    bucket = "mytestbucketpracticecode"
    key    = "team1/terraform.tfstate"
    region = "us-east-1"
  }
}
