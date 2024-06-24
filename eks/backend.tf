terraform {
  backend "s3" {
    bucket         = "tfbucket-venkatreddy279"
    key            = "state/eks/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-statelock-eks"
  }
}