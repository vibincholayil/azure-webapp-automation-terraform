

provider "azurerm" {
  features {}
  use_cli = true
  subscription_id = "81697b3e-f6a5-4d7f-8a2b-59a42bb0b8e9"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-flask"
  location = "West Europe" # or another region with F1 quota
}

resource "azurerm_service_plan" "asp" {
  name                = "demo-flask-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "flask-helloworld-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = false
  }
}