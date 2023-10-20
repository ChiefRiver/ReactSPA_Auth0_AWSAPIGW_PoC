variable "environment" {
  description = "environment e.g. 'dev; "
}
variable "primary_aws_region" {
  type        = string
  description = "The primary AWS region where resources will be created"
  default     = "us-east-1"
}
variable "Auth0Domain" {
 description = "Domain of the Auth0 account used for Authorization of API GW" 
}
variable "APIAudience" {
  description = "Audiance value of the APIs for API GW to validate" 
}


###########
# Lambda Vars
###########
variable "StaticZip_FilePath" {
  
}