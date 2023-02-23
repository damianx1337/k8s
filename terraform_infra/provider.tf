provider "kubernetes" {
  config_path = "kubeconfig"
  config_context = "1-node-cluster"
}

provider "helm" {
  kubernetes {
    config_path = "kubeconfig"
  }
}
