terraform {
  required_version = "~> 1.8.5"
  backend "s3" {
    bucket  = "web-ap-db-tfstate-bucket"
    region  = "ap-northeast-1"
    key     = "web-ap-db-resources.tfstate"
    profile = "terraform-user"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}