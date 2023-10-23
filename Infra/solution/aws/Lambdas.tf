# ################
# # Lambda for static
# ################
module "LambdaStatic" {
  source = ".//Lambdas"
  APIName ="static"
  APIGWID = "${aws_apigatewayv2_api.apigw.id}"
  region = "${var.region}"
  environment = "${var.environment}"
  appName = "${local.appName}"
  runtime = "nodejs18.x"
  APIGWExectionArn ="${aws_apigatewayv2_api.apigw.execution_arn}"
  ZipFileName = "${var.StaticZip_FilePath}"
  LambdaPolicyDocument = "${data.aws_iam_policy_document.Lambdastatic_PD.json}"
  LambdaEnvVars = {
      Dummy = "Dummy"
    }
}

# Policy to apply to Lambda Integration
data "aws_iam_policy_document" "Lambdastatic_PD" {
  statement {
      effect = "Allow"
      actions = [
        "logs:CreateLogGroup"
      ]
      resources = [
        "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:*",
      ]
    }
    statement {
      effect = "Allow"
      actions = [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      resources = [
        "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${local.appName}-${var.environment}-Lambda-static:*"
      ]
    }
    # statement {
    #   effect = "Allow"
    #   actions = [
    #     "secretsmanager:GetSecretValue"
    #   ]
    #   resources = [
    #     "${aws_secretsmanager_secret.Dummy.arn}"
    #   ]
    # }

  }
