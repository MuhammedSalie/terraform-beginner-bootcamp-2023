terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUID = var.user_uuid
    Name        = var.user_uuid
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "/workspace/terraform-beginner-bootcamp-2023/public/index.html"
  etag = filemd5("/workspace/terraform-beginner-bootcamp-2023/public/index.html")
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = "/workspace/terraform-beginner-bootcamp-2023/public/error.html"
  etag = filemd5("/workspace/terraform-beginner-bootcamp-2023/public/error.html")
}