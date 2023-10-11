terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

#terraform {
#  cloud {
#    organization = "MMIHoldings_Platforms_Test"
#
#    workspaces {
#      name = "Terra-house-1"
#    }
#  }
#}
provider "aws" {
  # Configuration options
}

#provider "random" {
#  # Configuration options
#}