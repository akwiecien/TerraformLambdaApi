resource "aws_lambda_function" "LambdaTerraformApi" {
  filename = "DeployPackage.zip"
  function_name = "LambdaTerraformApi"
  handler = "LambdaTerraformApi.lambda_handler"
  runtime = "python3.7"
  timeout = "60"
  role = "${aws_iam_role.LambdaApiRole.arn}"
}