/*
# Specify the provider
provider "azurerm" {
  features {}
  subscription_id = "81697b3e-f6a5-4d7f-8a2b-59a42bb0b8e9"
}

# Define the Azure Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Define the Azure App Service Plan (linux - Free Tier)
resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  os_type   = "linux"
  sku_name  = "F1"  
}

# Define the Azure App Service (Web App)
resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}


*/

