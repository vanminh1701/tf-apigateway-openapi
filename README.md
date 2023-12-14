### Simple API Gateway

The module requirements:
- Accept a `parent_path` and list of `actions` as input variables
- Each action should define a `path_part` and method
- Automatically create the API Gateway resources for each action:
    - Resource
    - Method
    - Integration (mock with 200 response)
    - Method response (200)
    - Integration response (200)
- Handle request/integration parameters for path variables like {id}
- Add an `OPTIONS` method for every `path_part`

Output

`terraform plan`
```
Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.api_gateway.aws_api_gateway_deployment.api_gateway will be created
  + resource "aws_api_gateway_deployment" "api_gateway" {
      + created_date  = (known after apply)
      + execution_arn = (known after apply)
      + id            = (known after apply)
      + invoke_url    = (known after apply)
      + rest_api_id   = (known after apply)
      + triggers      = {
          + "redeployment" = "6c7ef6167cbb4864ade028d74a388f637980f0d3"
        }
    }

  # module.api_gateway.aws_api_gateway_rest_api.api_gateway will be created
  + resource "aws_api_gateway_rest_api" "api_gateway" {
      + api_key_source               = (known after apply)
      + arn                          = (known after apply)
      + binary_media_types           = (known after apply)
      + body                         = jsonencode(
            {
              + info    = {
                  + title   = "api_gateway"
                  + version = "1.0"
                }
              + openapi = "3.0.1"
              + paths   = {
                  + "Card/"                     = {
                      + get     = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "GET"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + post    = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "POST"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                  + "Card/Compress"             = {
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + post    = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "POST"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                  + "Card/GetList/{customerId}" = {
                      + get     = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "GET"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                  + "Card/{id}"                 = {
                      + delete  = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "DELETE"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + get     = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "GET"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                }
            }
        )
      + created_date                 = (known after apply)
      + description                  = (known after apply)
      + disable_execute_api_endpoint = (known after apply)
      + execution_arn                = (known after apply)
      + id                           = (known after apply)
      + minimum_compression_size     = (known after apply)
      + name                         = "api_gateway"
      + policy                       = (known after apply)
      + put_rest_api_mode            = "merge"
      + root_resource_id             = (known after apply)
      + tags                         = {
          + "Writer" = "tvminh"
        }
      + tags_all                     = {
          + "Writer" = "tvminh"
        }

      + endpoint_configuration {
          + types            = [
              + "REGIONAL",
            ]
          + vpc_endpoint_ids = (known after apply)
        }
    }

  # module.api_gateway.aws_api_gateway_stage.dev will be created
  + resource "aws_api_gateway_stage" "dev" {
      + arn           = (known after apply)
      + deployment_id = (known after apply)
      + execution_arn = (known after apply)
      + id            = (known after apply)
      + invoke_url    = (known after apply)
      + rest_api_id   = (known after apply)
      + stage_name    = "dev"
      + tags          = {
          + "Writer" = "tvminh"
        }
      + tags_all      = {
          + "Writer" = "tvminh"
        }
      + web_acl_arn   = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + api_gateway_id = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to
take exactly these actions if you run "terraform apply" now.
```

`terraform apply --auto-approve`
```
Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.api_gateway.aws_api_gateway_deployment.api_gateway will be created
  + resource "aws_api_gateway_deployment" "api_gateway" {
      + created_date  = (known after apply)
      + execution_arn = (known after apply)
      + id            = (known after apply)
      + invoke_url    = (known after apply)
      + rest_api_id   = (known after apply)
      + triggers      = {
          + "redeployment" = "6c7ef6167cbb4864ade028d74a388f637980f0d3"
        }
    }

  # module.api_gateway.aws_api_gateway_rest_api.api_gateway will be created
  + resource "aws_api_gateway_rest_api" "api_gateway" {
      + api_key_source               = (known after apply)
      + arn                          = (known after apply)
      + binary_media_types           = (known after apply)
      + body                         = jsonencode(
            {
              + info    = {
                  + title   = "api_gateway"
                  + version = "1.0"
                }
              + openapi = "3.0.1"
              + paths   = {
                  + "Card/"                     = {
                      + get     = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "GET"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + post    = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "POST"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                  + "Card/Compress"             = {
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + post    = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "POST"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                  + "Card/GetList/{customerId}" = {
                      + get     = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "GET"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                  + "Card/{id}"                 = {
                      + delete  = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "DELETE"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + get     = {
                          + responses                       = {
                              + "200" = {
                                  + statusCode = 200
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "GET"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + id         = "$input.params('id')"
                                          + statusCode = 200
                                        }
                                    )
                                }
                              + responses           = {
                                  + "200" = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + id         = "$input.params('id')"
                                                  + statusCode = 200
                                                }
                                            )
                                        }
                                      + statusCode        = 200
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                      + options = {
                          + responses                       = {
                              + "204" = {
                                  + statusCode = 204
                                }
                            }
                          + x-amazon-apigateway-integration = {
                              + httpMethod          = "OPTIONS"
                              + passthroughBehavior = "when_no_templates"
                              + requestTemplates    = {
                                  + "application/json" = jsonencode(
                                        {
                                          + statusCode = 204
                                        }
                                    )
                                }
                              + responses           = {
                                  + default = {
                                      + responseTemplates = {
                                          + "application/json" = jsonencode(
                                                {
                                                  + statusCode = 204
                                                }
                                            )
                                        }
                                      + statusCode        = 204
                                    }
                                }
                              + type                = "MOCK"
                            }
                        }
                    }
                }
            }
        )
      + created_date                 = (known after apply)
      + description                  = (known after apply)
      + disable_execute_api_endpoint = (known after apply)
      + execution_arn                = (known after apply)
      + id                           = (known after apply)
      + minimum_compression_size     = (known after apply)
      + name                         = "api_gateway"
      + policy                       = (known after apply)
      + put_rest_api_mode            = "merge"
      + root_resource_id             = (known after apply)
      + tags                         = {
          + "Writer" = "tvminh"
        }
      + tags_all                     = {
          + "Writer" = "tvminh"
        }

      + endpoint_configuration {
          + types            = [
              + "REGIONAL",
            ]
          + vpc_endpoint_ids = (known after apply)
        }
    }

  # module.api_gateway.aws_api_gateway_stage.dev will be created
  + resource "aws_api_gateway_stage" "dev" {
      + arn           = (known after apply)
      + deployment_id = (known after apply)
      + execution_arn = (known after apply)
      + id            = (known after apply)
      + invoke_url    = (known after apply)
      + rest_api_id   = (known after apply)
      + stage_name    = "dev"
      + tags          = {
          + "Writer" = "tvminh"
        }
      + tags_all      = {
          + "Writer" = "tvminh"
        }
      + web_acl_arn   = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + api_gateway_id = (known after apply)
module.api_gateway.aws_api_gateway_rest_api.api_gateway: Creating...
module.api_gateway.aws_api_gateway_rest_api.api_gateway: Creation complete after 2s [id=5zvfoy8mcg]
module.api_gateway.aws_api_gateway_deployment.api_gateway: Creating...
module.api_gateway.aws_api_gateway_deployment.api_gateway: Creation complete after 1s [id=buk69r]
module.api_gateway.aws_api_gateway_stage.dev: Creating...
module.api_gateway.aws_api_gateway_stage.dev: Creation complete after 1s [id=ags-5zvfoy8mcg-dev]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

api_gateway_id = "arn:aws:apigateway:us-east-1::/restapis/5zvfoy8mcg"

```