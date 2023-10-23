terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
     auth0 = {
      source  = "auth0/auth0"
      version = ">= 1.0.0"
    }
  }
}


provider "aws" {
  region  = var.primary_aws_region
}

provider "auth0" {}



module "Solution_AWS" {
  source = "../solution/aws"
  region = var.primary_aws_region
  environment = var.environment
  Auth0Domain = var.Auth0Domain
  APIAudience = var.APIAudience

  StaticZip_FilePath = var.StaticZip_FilePath

}

module "Solution_Auth0" {
  source = "../solution/auth0"
}