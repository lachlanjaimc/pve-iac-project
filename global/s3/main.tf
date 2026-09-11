terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 6.64.0"
    }
  }

  backend "s3" {
    key            = "global/s3/terraform.tfstate"
    bucket         = "pve-iac-project-tfstate-9ut8e"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_string" "bucket_suffix" {
  length = 5
  special = false
  upper = false
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "pve-iac-project-tfstate-${random_string.bucket_suffix.result}"

    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default_config" {
    bucket = aws_s3_bucket.terraform_state.id

    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
    }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}