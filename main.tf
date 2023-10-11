#terraform {
#  required_providers {
#    random = {
#      source = "hashicorp/random"
#      version = "3.5.1"
#    }
#  }
#}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  lower            = true
  upper            = false
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUID = var.user_uuid
    Name        = random_string.bucket_name.id
    Environment = "Dev"
  }
}

