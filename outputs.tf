output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.aks_rg.name
}

output "kubernetes_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "kubernetes_cluster_id" {
  description = "ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "location" {
  description = "Location of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.location
}

output "host" {
  description = "Kubernetes API server host"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  sensitive   = true
}

output "kube_config" {
  description = "Raw kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}

output "cluster_identity" {
  description = "System-assigned managed identity of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.identity
}

output "node_resource_group" {
  description = "Resource group containing the AKS cluster nodes"
  value       = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
}

output "fqdn" {
  description = "FQDN of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.fqdn
}
