


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" { # backend ante remote store ani anukovali
    bucket = "dsoaws-remote-state"
    key    = "dev-infra-database" # so here keys must be not for the same for all, u have to set name as per the requirement 
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

## backend ani pettakunda iste adhi local lo velli store avuthundhi...


# actual CMD is as per doc

# terraform {
#   backend "s3" {
#     bucket       = "example-bucket"
#     key          = "path/to/state"
#     use_lockfile = true
#     region       = "us-east-1"
#   }
# }
