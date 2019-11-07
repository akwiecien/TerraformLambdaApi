data "archive_file" "lambda_zip" {
    type        = "zip"
    source_dir  = "../.aws-sam/build/HelloWorldFunction"
    output_path = "DeployPackage.zip"
}