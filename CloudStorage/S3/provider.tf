terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-west-1"
  profile = "s1"
}

provider "aws" {
  alias   = "central"
  region  = "us-west-2"
  profile = "s1"
}