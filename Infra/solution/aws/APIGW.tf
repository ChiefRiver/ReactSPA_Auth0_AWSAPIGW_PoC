# ################
# # HTTP API GW & Authorizer
# ################
resource "aws_apigatewayv2_api" "apigw" {
  name          = "${local.appName}-${var.environment}"
  protocol_type = "HTTP"
  cors_configuration {
      allow_headers = ["authorization"]
      allow_methods = ["GET"]
      allow_credentials = "true"
      allow_origins = ["http://localhost:3000","http://localhost:3000/"]
  }
}

resource "aws_apigatewayv2_authorizer" "Auth0" {
  api_id           = aws_apigatewayv2_api.apigw.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name             = "Auth0-${var.environment}"

  jwt_configuration {
    audience = var.APIAudience
    issuer   = "https://${var.Auth0Domain}.us.auth0.com/"
  }
}


resource "aws_apigatewayv2_stage" "example" {
  api_id = aws_apigatewayv2_api.apigw.id
  name   = "v1"
  auto_deploy = true
}