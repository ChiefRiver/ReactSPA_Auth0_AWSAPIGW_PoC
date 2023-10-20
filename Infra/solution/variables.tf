variable "environment" {
  description = "environment e.g. 'dev' "
}
variable "region" {
  type        = string
  description = "The primary AWS region where resources will be created"
}
variable "Auth0Domain" {
 description = "Domain of the Auth0 account used for Authorization of API GW" 
}
variable "APIAudience" {
  description = "Audiance value of the APIs for API GW to validate" 
}

##########
# Lambda File Locations
##########

variable "StaticZip_FilePath" {
  description = "file location and name of zip for initial lambad creation"
}