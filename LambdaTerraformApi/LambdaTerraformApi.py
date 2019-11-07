import json


def lambda_handler(event, context):

    return {
        "statusCode": 200,
        "body": json.dumps({
            "resource": "Lambda function",
            "trigger": "Api"
        }),
        "headers": {
            "Access-Control-Allow-Origin" : "*"
        }
    }
