resource "aws_api_gateway_integration" "GetMethodIntegration" {
  rest_api_id = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
  resource_id = "${aws_api_gateway_method.GetMethod.resource_id}"
  http_method = "${aws_api_gateway_method.GetMethod.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.LambdaTerraformApi.invoke_arn}"
}

resource "aws_api_gateway_integration" "OptionMethodIntegration" {
    rest_api_id   = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
    resource_id   = "${aws_api_gateway_resource.CostResource.id}"
    http_method   = "${aws_api_gateway_method.OptionMethod.http_method}"
    type          = "MOCK"
    depends_on = ["aws_api_gateway_method.OptionMethod"]
}

resource "aws_api_gateway_integration_response" "OptionMethodIntegrationResponse" {
    rest_api_id   = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
    resource_id   = "${aws_api_gateway_resource.CostResource.id}"
    http_method   = "${aws_api_gateway_method.OptionMethod.http_method}"
    status_code   = "${aws_api_gateway_method_response.OptionMethodResponse.status_code}"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
        "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
        "method.response.header.Access-Control-Allow-Origin" = "'*'"
    }
    depends_on = ["aws_api_gateway_method_response.OptionMethodResponse"]
}