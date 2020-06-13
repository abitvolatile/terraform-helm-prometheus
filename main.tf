### Terraform Resources

# Kubernetes Resources

provider "kubernetes" {
  version = "1.11.2"

  load_config_file       = false
  host                   = "https://${var.k8s_cluster_endpoint}"
  token                  = var.k8s_access_token
  cluster_ca_certificate = var.k8s_cluster_ca_certificate
}


resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = "prometheus"

    annotations = {
      nodepool_name = var.k8s_nodepool_name
    }
  }
}



# Helm Resources

provider "helm" {
  version = "1.2.1"

  kubernetes {
    load_config_file       = false
    host                   = "https://${var.k8s_cluster_endpoint}"
    token                  = var.k8s_access_token
    cluster_ca_certificate = var.k8s_cluster_ca_certificate
  }
}


resource "helm_release" "prometheus" {
  name      = "prometheus"
  chart     = "${path.module}/helm/prometheus"
  namespace = "prometheus"
  version   = var.helm_chart_version

  create_namespace  = true
  dependency_update = true
  recreate_pods     = true
  force_update      = true
  atomic            = true
  cleanup_on_fail   = false
  wait              = true
  timeout           = "1200" # 20mins

  set {
    name  = "cluster.nodepool.name"
    value = var.k8s_nodepool_name
  }

  set {
    name  = "prometheus-operator.grafana.adminUser"
    value = var.prometheus-adminuser
  }

  set {
    name  = "prometheus-operator.grafana.adminPassword"
    value = var.prometheus-adminpassword
  }
}
