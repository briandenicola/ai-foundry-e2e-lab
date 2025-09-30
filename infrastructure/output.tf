output "TENANT_ID" {
    value = data.azurerm_client_config.current.tenant_id
    sensitive = false
}

output "AZURE_SUBSCRIPTION_ID" {
    value = data.azurerm_subscription.current.subscription_id
    sensitive = false
}

output "APP_NAME" {
    value = local.resource_name
    sensitive = false
}

output "APP_RESOURCE_GROUP" {
    value = azurerm_resource_group.this.name
    sensitive = false
}

output "OPENAI_ENDPOINT" {
    value = azurerm_ai_foundry.this.discovery_url
    sensitive = false
}

output "PROJECT_CONNECTION_STRING" {
    #<HostName>;<AzureSubscriptionId>;<ResourceGroup>;<ProjectName>    
    value = "${trimsuffix(trimprefix(azurerm_ai_foundry.this.discovery_url,"https://"), "/discovery")};${data.azurerm_subscription.current.subscription_id};${local.resource_name}-ai_rg;${local.project_name}" 
    sensitive = false
}

output "AZURE_AI_PROJECT_ENDPOINT" {
    value = "https://${local.resource_name}.cognitiveservices.azure.com/" 
    sensitive = false
}

output "MODEL_DEPLOYMENT_NAME" {
    value = azurerm_cognitive_deployment.gpt_4o.name
    sensitive = false
}

output "EMBEDDING_MODEL_DEPLOYMENT_NAME" {
    value = azurerm_cognitive_deployment.text_embedding_3_large.name
    sensitive = false
}

output "GROUNDING_WITH_BING_CONNECTION_NAME" {
    value = local.bing_ground_connection_name
    sensitive = false
}

output AZURE_AI_SEARCH_ENDPOINT {
    value = azapi_resource.ai_search.output.properties.endpoint
    sensitive = false
}

output AZURE_AI_SEARCH_API_KEY {
    value = data.azapi_resource_action.search_keys.output.primaryKey
    sensitive = true
}