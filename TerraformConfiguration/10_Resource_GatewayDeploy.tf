resource "aws_api_gateway_deployment" "TerraformLambdaApiDeployment" {
    depends_on = ["aws_api_gateway_integration.GetMethodIntegration","aws_api_gateway_integration.OptionMethodIntegration"]
    stage_name = "prod"
    rest_api_id = "${aws_api_gateway_rest_api.TerraformLambdaApiRestApi.id}"
}

output "API_Endpoint" {
  value = "${aws_api_gateway_deployment.TerraformLambdaApiDeployment.invoke_url}/cost"
}