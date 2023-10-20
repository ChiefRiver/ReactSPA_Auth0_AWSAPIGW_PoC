output "APIUrl" {
  value = replace(aws_apigatewayv2_stage.example.invoke_url, "wss://", "https://")
}