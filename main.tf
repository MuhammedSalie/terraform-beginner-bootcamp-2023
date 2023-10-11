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

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.id

  tags = {
    UserUID = var.user_uuid
    Name        = random_string.bucket_name.id
    Environment = "Dev"
  }
}

