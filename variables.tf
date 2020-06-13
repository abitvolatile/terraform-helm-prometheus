# Input Variables

variable "k8s_cluster_endpoint" {
  description = "Google Kubernetes Engine Cluster Endpoint"
}

variable "k8s_cluster_ca_certificate" {
  description = "Google Kubernetes Engine CA Certificate"
}

variable "k8s_nodepool_name" {
  description = "Google Kubernetes Engine Node Pool Name"
}

variable "k8s_access_token" {
  description = "Kubernetes Auth Token"
}

variable "helm_chart_version" {
  description = "Helm Chart Version"
}

variable "grafana_adminuser" {
  description = "Prometheus Operator Grafana Admin Username"
}

variable "grafana_adminpassword" {
  description = "Prometheus Operator Grafana Admin Password"
}
