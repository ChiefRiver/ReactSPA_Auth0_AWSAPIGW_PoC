data "aws_caller_identity" "current" {}

################
# API GW Integration
################

resource "aws_apigatewayv2_integration" "apiintegration" {
  api_id           = "${var.APIGWID}"
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  description               = "${var.APIName} integration"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.lambda.invoke_arn
  payload_format_version    = "2.0"
  passthrough_behavior    = "WHEN_NO_MATCH"

  response_parameters  {
    status_code = "200"
    mappings ={
       "overwrite:header.Strict-Transport-Security" = "max-age=63072000; includeSubdomains"
    }
  }
}

################
# Lambda for new API
################
resource "aws_iam_role" "iam_for_lambda" {
  name = "${var.appName}-${var.environment}-lambda-${var.APIName}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "${var.appName}-${var.environment}-lambda-${var.APIName}-policy"
  description = "IAM policy ${var.APIName} lambda function"
  tags = {}
  policy = "${var.LambdaPolicyDocument}"
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${var.appName}-${var.environment}-Lambda-${var.APIName}"
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${var.APIGWExectionArn}/*/*/*"

  depends_on = [aws_lambda_function.lambda]
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}


resource "aws_lambda_function" "lambda" {
  filename      = "${path.root}/${var.ZipFileName}"
  function_name = "${var.appName}-${var.environment}-Lambda-${var.APIName}"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "${var.LambdaHandler}"
  timeout = "${var.LambdaTimeout}"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("${path.root}/${var.ZipFileName}")

  runtime = "${var.runtime}"

   environment {
    variables = "${var.LambdaEnvVars}"
  }
}