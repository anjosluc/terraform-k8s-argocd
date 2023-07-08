output "argocd_install_values" {
    value = var.argoCDEnabled ? helm_release.argocd_install[0].values : null
}

output "argorollouts_install_values" {
    value = var.argoRolloutsEnabled ? helm_release.argorollouts_install[0].values : null
}
