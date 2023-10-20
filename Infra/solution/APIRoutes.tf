resource "aws_apigatewayv2_route" "route_static" {
  api_id    = aws_apigatewayv2_api.apigw.id
  route_key = "GET /static"
  authorization_type = "JWT"
  authorizer_id = aws_apigatewayv2_authorizer.Auth0.id
  target = "integrations/${module.LambdaStatic.APIIntegrationID}"
}