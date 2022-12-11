terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-devops" {
  name     = "rg-devops"
  location = var.region
}

resource "azurerm_service_plan" "app-service-plan" {
  name                = "${azurerm_resource_group.rg-devops.name}-plan" 
  resource_group_name = azurerm_resource_group.rg-devops.name
  location            = azurerm_resource_group.rg-devops.location
  sku_name            = "F1"
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "app" {
  name                = "app-devops-dhbw"
  resource_group_name = azurerm_resource_group.rg-devops.name
  location            = azurerm_resource_group.rg-devops.location
  service_plan_id     = azurerm_service_plan.app-service-plan.id

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false

    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = "https://public-registry.amtmann.de/"
    DOCKER_REGISTRY_SERVER_USERNAME = "publicregistry"
    DOCKER_REGISTRY_SERVER_PASSWORD = "WBJWdiPhnDsQUB3iKFAwRAYxV"
  }

  site_config {
    always_on = false
    application_stack {
      docker_image     = "dhbwdevops"
      docker_image_tag = "latest"
    }
  }
}