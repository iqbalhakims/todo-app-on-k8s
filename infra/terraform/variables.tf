variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "todoapp-cluster"
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "sgp1" # Singapore
}

variable "k8s_version" {
  description = "Kubernetes version slug"
  type        = string
  default     = "1.34.1-do.3
"
}

variable "node_size" {
  description = "Droplet size for worker nodes"
  type        = string
  default     = "s-2vcpu-2gb" # 2 vCPU, 2GB RAM (~$18/mo)
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}
