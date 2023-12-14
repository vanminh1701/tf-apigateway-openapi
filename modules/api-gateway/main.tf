locals {

  ## Handle actions
  # Calculate all api paths
  unique_paths = distinct([for each_action in var.actions : "${var.parent_path}/${each_action.path_part}"])
  # handle paths
  origin_paths = {
    for each_path in local.unique_paths : each_path => {
      for each_action in var.actions : lower(each_action.method) => {
        responses = {
          "200" = {
            statusCode = 200
          }
        }
        x-amazon-apigateway-integration = {
          httpMethod = each_action.method
          type       = "MOCK"
          passthroughBehavior : "when_no_templates"
          requestTemplates = {
            "application/json" = jsonencode({
              statusCode : 200,
              id : "$input.params('id')"
            })
          }
          responses = {
            "200" = {
              statusCode = 200
              responseTemplates = {
                "application/json" = jsonencode({
                  statusCode : 200
                  id : "$input.params('id')"
                })
              }
            }
          }
        }
      } if each_path == "${var.parent_path}/${each_action.path_part}"
    }
  }
  # Add OPTIONS method
  paths = {
    for each_path in local.unique_paths : each_path => merge(local.origin_paths[each_path], {
      options = {
        responses = {
          "204" = {
            statusCode = 204
          }
        }
        x-amazon-apigateway-integration = {
          type       = "MOCK",
          httpMethod = "OPTIONS"
          passthroughBehavior : "when_no_templates"
          requestTemplates = {
            "application/json" = jsonencode({ "statusCode" : 204 })
          }
          responses = {
            default = {
              statusCode = 204
              responseTemplates = {
                "application/json" = jsonencode({ "statusCode" : 204 })
              }
            }
          }
        }
      }
    })
  }
}

resource "aws_api_gateway_rest_api" "api_gateway" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "api_gateway"
      version = "1.0"
    }

    paths = local.paths
  })

  name              = "api_gateway"
  put_rest_api_mode = "merge"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = var.tags
}

resource "aws_api_gateway_deployment" "api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api_gateway.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.api_gateway.id
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  stage_name    = "dev"

  tags = var.tags
}