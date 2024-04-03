terraform {
    required_version = ">=1.6.1"
    required_providers {
        aws = ">=5.2.25"
        local = ">=2.4.0"

    }
}

provider "aws" {
    region = "sa-east-1"
}