resource "aws_api_gateway_method" "GetMethod" {
  rest_api_id   = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
  resource_id   = "${aws_api_gateway_resource.CostResource.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "OptionMethod" {
  rest_api_id = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
  resource_id = "${aws_api_gateway_resource.CostResource.id}"
  http_method = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "OptionMethodResponse" {
    rest_api_id   = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
    resource_id   = "${aws_api_gateway_resource.CostResource.id}"
    http_method   = "${aws_api_gateway_method.OptionMethod.http_method}"
    status_code   = "200"
    response_models = {
        "application/json" = "Empty"
    }
    response_parameters = {
        "method.response.header.Access-Control-Allow-Headers" = true,
        "method.response.header.Access-Control-Allow-Methods" = true,
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = ["aws_api_gateway_method.OptionMethod"]
}
