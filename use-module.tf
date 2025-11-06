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

module "my-ketan-module-ec2" {
    source = "./modules/ec2"
    ketan-ami-id = "ami-0a25a306450a2cba3"
    vm-name = "ketan-vmby-module"
    vm-size = "t2.nano"
    ec2-key-name = "ketanby-mode"
    private-key-algo = "RSA"
    key-size = 4096
    my-vpc-id = "vpc-02d56e9aa1ce2f114"
    my-sec-group-name = "ketan-bymode-sec"
    novm = 2
    

  
}