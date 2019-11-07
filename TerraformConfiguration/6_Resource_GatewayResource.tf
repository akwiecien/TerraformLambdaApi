resource "aws_api_gateway_resource" "CostResource" {
  rest_api_id = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
  parent_id   = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.root_resource_id}"
  path_part   = "cost"
  
}
# resource becomes endpoint of our API