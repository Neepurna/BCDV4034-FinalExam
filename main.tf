# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.common_tags
}

# Create Azure Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${var.aks_cluster_name}-dns"

  # System-assigned managed identity
  identity {
    type = "SystemAssigned"
  }

  # Default node pool
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
    
    # Enable auto-scaling (optional)
    enable_auto_scaling = false
    
    tags = var.common_tags
  }

  # Storage profile with all required drivers
  storage_profile {
    blob_driver_enabled         = true
    disk_driver_enabled         = true
    file_driver_enabled         = true
    snapshot_controller_enabled = true
  }

  # Network profile (using kubenet for simplicity)
  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = var.common_tags
}
