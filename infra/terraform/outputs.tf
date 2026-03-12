output "cluster_id" {
  description = "Kubernetes cluster ID"
  value       = digitalocean_kubernetes_cluster.todoapp.id
}

output "cluster_endpoint" {
  description = "Kubernetes cluster API endpoint"
  value       = digitalocean_kubernetes_cluster.todoapp.endpoint
}

output "kubeconfig" {
  description = "Kubeconfig for the cluster"
  value       = digitalocean_kubernetes_cluster.todoapp.kube_config[0].raw_config
  sensitive   = true
}
