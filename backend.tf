terraform {
  backend "s3" {
    bucket  = "techbleat744"           # your existing S3 bucket name.
    key     = "prod/terraform.tfstate" # path to the state file inside the bucket
    region  = "us-east-1"              # bucket region
    encrypt = true                     # enable server-side encryption
  }
}
