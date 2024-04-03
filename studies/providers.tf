terraform {
  required_version = ">=0.14.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.39.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">=2.4.1"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}
