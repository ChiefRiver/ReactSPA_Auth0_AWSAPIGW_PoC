output "AWS_InfraOutputs" {
  value = module.Solution_AWS
}

output "Auth0_InfraOutputs" {
  value = module.Solution_Auth0
  sensitive = true
}

output "Auth0_DOMAIN" {
  value = var.Auth0FullDomain
}