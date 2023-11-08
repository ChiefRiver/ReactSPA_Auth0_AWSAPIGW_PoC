output "BaseUrl" {
  value = "BaseURL"
}
output "Auth0Client" {
  value = auth0_client.my_app.client_id 
}
output "Audiance" {
  value = auth0_resource_server.resourceServer.identifier 
}
output "CustomScopes" {
  value = auth0_resource_server_scopes.my_api_scopes.scopes
}