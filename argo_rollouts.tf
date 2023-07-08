resource "helm_release" "argorollouts_install" {
  count            = var.argoRolloutsEnabled ? 1 : 0 
  
  chart            = "argo-rollouts"
  name             = "argo-rollouts"
  namespace        = var.argoRolloutsNamespace

  force_update     = false
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "2.21.1"

  set {
    name  = "dashboard.enabled"
    value = true
  }

  set {
    name  = "dashboard.ingress.enabled"
    value = true
  }

  set {
    name  = "dashboard.ingress.hosts[0]"
    value = var.argoRolloutsHost
  }

}