resource "helm_release" "argocd_install" {
  count            = var.argoCDEnabled ? 1 : 0 

  chart            = "argo-cd"
  name             = "argo-cd"
  namespace        = var.argoCDNamespace

  force_update     = false
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "5.9.1"

  values = [
    "${templatefile("${path.module}/default-argocd-values.yaml", {
      defaultRecipients     = var.defaultRecipients
      githubURL             = var.githubURL
      githubToken           = var.githubToken
      slackToken            = var.slackToken
      serviceTeamsChannels  = var.serviceTeamsChannels
      argoUrl               = "https://${var.argoHost}"
    })}"
  ]

  set {
    name  = "configs.secret.createSecret"
    value = true
  }

  set {
    name  = "configs.params.server\\.insecure"
    value = true
  }
  
  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = bcrypt(var.argoAdminPassword)
  }

  set {
    name  = "configs.secret.githubSecret"
    value = var.githubToken
  }

  set {
    name  = "controller.metrics.enabled"
    value = var.controllerMetricsEnabled
  }

  set {
    name  = "controller.replicas"
    value = var.controllerReplicas
  }

  set {
    name = "controller.metrics.serviceMonitor.enabled"
    value = var.serviceMonitorEnabled
  }

  set {
    name  = "server.replicas"
    value = var.serverReplicas
  }

  set {
    name  = "server.autoscaling.enabled"
    value = true
  }

  set {
    name  = "server.config.url"
    value = "https://${var.argoHost}"
  }

  set {
    name  = "server.configEnabled"
    value = true
  }

  set {
    name  = "server.config.dex\\.config"
    value = <<YAML
connectors:
- type: ldap
  id: ldap
  name: example.com
  config:
    host: ${var.LDAPHost}:636
    insecureNoSSL: false
    insecureSkipVerify: true
    bindDN: ${var.argoUserDN}
    bindPW: ${var.argoLDAPPassword}
    userSearch:
      baseDN: dc=example\,dc=com
      filter: "(objectclass=user)"
      username: sAMAccountName
      idAttr: sAMAccountName
      nameAttr: givenName
      emailAttr: mail
    groupSearch:
      baseDN: dc=example\,dc=com
      filter: "(objectClass=group)"
      nameAttr: cn
      userAttr: distinguishedName
      groupAttr: member
YAML

  }

  set {
    name  = "server.rbacConfig.policy\\.csv"
    value = <<EOF
g\, ARGOCD-ADMINS\, role:admin
EOF
  }

#   set {
#     name  = "server.config.oidc\\.config"
#     value = <<YAML
# name: AzureAD
# issuer: https://login.microsoftonline.com/TENANT_ID/v2.0
# clientID: CLIENT_ID
# clientSecret: $oidc.azuread.clientSecret
# requestedIDTokenClaims:
#   groups:
#     essential: true
# requestedScopes:
#   - openid
#   - profile
#   - email
# YAML
#   }

  set {
    name  = "server.extensions.enabled"
    value = var.extensionsEnabled
  }

  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }

  set {
    name = "server.ingress.enabled"
    value = true
  }

  set {
    name  = "server.ingress.https"
    value = false
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = var.argoHost
  }

  set {
    name  = "server.metrics.enabled"
    value = var.metricsEnabled 
  }
  
  set {
    name  = "repoServer.replicas"
    value = var.repoServerReplicas
  }

  set {
    name  = "repoServer.autoscaling.enabled"
    value = true
  }

}

# resource "kubectl_manifest" "argocd_manifest_github_secret" {
#   yaml_body = <<YAML
# apiVersion: v1
# kind: Secret
# metadata:
#   name: github-enterprise-argocd
#   namespace: ${var.namespace}
#   labels:
#     argocd.argoproj.io/secret-type: repo-creds
# stringData:
#   type: git
#   url: https://github.com
#   password: ${var.githubToken}
#   username: svc-argocd-github
# YAML
# }

resource "kubectl_manifest" "argocd_rollouts_extension" {
  count = var.install_argocd_rollouts_extension ? 1 : 0
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: ArgoCDExtension
metadata:
  name: argo-rollouts
  finalizers:
    - extensions-finalizer.argocd.argoproj.io
spec:
  sources:
  - web:
      url: https://github.com/argoproj-labs/rollout-extension/releases/download/v0.1.0/extension.tar
YAML
}