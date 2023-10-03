#terraform {
#  required_providers {
#    random = {
#      source = "hashicorp/random"
#      version = "3.5.1"
#    }
#  }
#}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

terraform {
  cloud {
    organization = "MMIHoldings_Platforms_Test"

    workspaces {
      name = "Terra-house-1"
    }
  }
}
provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  lower            = true
  upper            = false
}

output random_bucket_name {
    value = random_string.bucket_name.id
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.id

  tags = {
    Name        = random_string.bucket_name.id
    Environment = "Dev"
  }
}