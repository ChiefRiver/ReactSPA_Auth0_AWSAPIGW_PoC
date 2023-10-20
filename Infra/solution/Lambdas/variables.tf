variable "APIGWID" {
  description = "id of the API GW"
}
variable "APIName" {
  description = "Name for the API"
}
variable "appName" { 
}
variable "environment" {
  description = ""
  default = ""
}
variable "region" {
  description = ""
  default = ""
}

variable "LambdaTimeout" {
  description = "timeout value for Lambda"
  default = 3
}

variable "LambdaHandler" {
  description = "timeout value for Lambda"
  default = "index.handler"
}

variable "runtime" {
  description = "runtime for lambda"
}

variable "LambdaEnvVars"{
  type = map
}

variable "APIGWExectionArn"{
  description = "API GW Exection Arn"
}

variable "ZipFileName"{
  description = "location of zip to get lambda published"
}

variable "LambdaPolicyDocument"{
  description = "Policy applied to lambda function"

}
