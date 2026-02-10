



terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" { # backend ante remote store ani anukovali
    bucket = "dsoaws-remote-store"
    key    = "dev-infra-sg" # so here keys must be not for the same for all, u have to set name as per the requirement 
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}


