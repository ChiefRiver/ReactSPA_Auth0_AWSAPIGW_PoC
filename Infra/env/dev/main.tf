terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region  = var.primary_aws_region
}

module "Solution" {
  source = "../../solution"
  region = var.primary_aws_region
  environment = var.environment
  Auth0Domain = var.Auth0Domain
  APIAudience = var.APIAudience

  StaticZip_FilePath = var.StaticZip_FilePath

}