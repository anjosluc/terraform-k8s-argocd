terraform {
  required_version = ">= 0.12.7"

  required_providers {
    helm = ">= 2.3.0"
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}