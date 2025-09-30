resource "azapi_resource" "ai_search_connection" {
  type      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name      = local.ai_search_connection_name
  parent_id = azapi_resource.foundry_project.id

  body = {
    properties = {
      category      = "CognitiveSearch"
      authType      = "ApiKey"
      isSharedToAll = true
      metadata = {
        ApiType    = "Azure"
        ResourceId = azapi_resource.ai_search.id
        type       = "ai_serach"
      }
      target = azapi_resource.ai_search.output.properties.endpoint
      credentials = {
        key = data.azapi_resource_action.search_keys.output.primaryKey
      }
    }
  }
}

resource "azapi_resource" "bing_connection" {
  type = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"

  name      = local.bing_ground_connection_name
  parent_id = azapi_resource.foundry_project.id

  body = {
    properties = {
      category      = "ApiKey"
      authType      = "ApiKey"
      isSharedToAll = true
      metadata = {
        ApiType    = "Azure"
        ResourceId = azapi_resource.bing_grounding.id
        type       = "bing_grounding"
      }
      target = azapi_resource.bing_grounding.output.properties.endpoint
      credentials = {
        key = data.azapi_resource_action.bing_keys.output.key1
      }
    }
  }
}
