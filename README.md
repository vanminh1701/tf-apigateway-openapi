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