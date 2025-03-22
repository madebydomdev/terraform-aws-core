terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "tf-state-eu-north-1-685117240008"
    key     = "terraform.tfstate"
    region  = "eu-north-1"
    profile = ""

    use_lockfile = true
  }
}

provider "aws" {
  region  = "eu-north-1"
  profile = "sso"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
