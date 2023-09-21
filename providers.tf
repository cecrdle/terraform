terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

  }
}

provider "kubernetes" {
    config_path    = "~/.kube/config"
    config_context = "minikube"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "argocd" {
  source  = "aigisuk/argocd/kubernetes"
  version = "0.2.7"
}

#resource "helm_release" "argocd" {
#  name  = "argocd"
#
#  repository       = "https://argoproj.github.io/argo-helm"
#  chart            = "argo-cd"
#  namespace        = "argocd"
#  version          = "4.9.7"
#  create_namespace = true
#
#  values = [
#    file("argocd/application.yaml")
#  ]
#}
