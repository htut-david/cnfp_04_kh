terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

provider "aws" {
  # profile = "master-console-admin"
  # region = "ap-southeast-1"
  # Configuration options
}