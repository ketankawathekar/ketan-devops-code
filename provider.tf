terraform {
  backend "s3" {
    bucket         = "ketan-roche-terraform-lock-bucket"
    key            = "dev/ketan/terraform.tfstate"
    dynamodb_table = "ketan-roche-table"
    region         = "ap-southeast-2"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}
