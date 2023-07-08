## ARGOCD VARIABLES
variable "argoCDEnabled" {
    type        = bool
    default     = true
    description = "(optional) describe your variable"
}

variable "harborHelmRepoURL" {
    type    = string
    default = "https://harbor.example.com/chartrepo/helm-charts"
}

variable "argoCDNamespace" {
    type = string
    default = "argocd"
    description = "(optional) describe your variable"
}

variable "argoAdminPassword" {
    type = string
    sensitive = true
    description = "(optional) describe your variable"
}

variable "githubURL" {
    type = string
    default = "https://github.com/api/v3"
}

variable "githubToken" {
    type = string
    sensitive = true
    description = "(optional) describe your variable"
}

variable "slackToken" {
    type = string
    sensitive = true
    description = "(optional) describe your variable"
}

variable "controllerMetricsEnabled" {
    type = bool
    default = false
    description = "(optional) describe your variable"
}

variable "controllerReplicas" {
    type = number
    default = 3
    description = "Controller replicas"
}

variable "serviceMonitorEnabled" {
    type = bool
    default = true
    description = "(optional) describe your variable"
}

variable "LDAPHost" {
    type = string
    default = "10.0.0.1"
    description = "(optional) describe your variable"
}

variable "argoUserDN" {
    type = string
    default = "cn=svc_argocd_github\\,dc=example\\,dc=com"
    description = "(optional) describe your variable"
}

variable "argoLDAPPassword" {
    type = string
    sensitive = true
    description = "(optional) describe your variable"
}

variable "extensionsEnabled" {
    type    = bool
    default = true
    description = "(optional) describe your variable"
}

variable "argoHost" {
    type = string
    default = "argocd.example.com"
    description = "(optional) describe your variable"
}

variable "metricsEnabled" {
    type = bool
    default = true
    description = "(optional) describe your variable"
}

variable "install_argocd_rollouts_extension" {
    type = bool
    default = true
}

variable "defaultRecipients" {
    type = map(string)
    default = {
     "mail" = "admin@example.com"   
     "teams"   = "default"
    }
    description = "(optional) describe your variable"
}

variable "serviceEmailSettings" {
    type = map(string)
    default = {
      "host" = "mail.example.com"
      "port" = "25"
      "from" = "argocd@example.com"
    }
}

variable "serviceTeamsChannels" {
    type = map(string)
    default = {
      "default" = "<TEAMS WEBHOOK URL>"
    }
}

variable "serverReplicas" {
    type    = number
    default = 3
    description = "Server replicas"
}

variable "repoServerReplicas" {
    type    = number
    default = 3
    description = "Repo Server replicas"
}

## ARGO ROLLOUTS VARIABLES

variable "argoRolloutsEnabled" {
    type = bool
    default = false
    description = "(optional) describe your variable"
}

variable "argoRolloutsNamespace" {
    type = string
    default = "argo-rollouts"
    description = "(optional) describe your variable"
}

variable "argoRolloutsHost" {
    type = string
    default = "argo-rollouts.example.com"
    description = "(optional) describe your variable"
}