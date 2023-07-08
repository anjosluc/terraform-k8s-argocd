# Terraform Module K8S Argo applications

Default Terraform module to install Argo applications on Kubernetes clusters. It can install ArgoCD and Argo Rollouts.

![Argo](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6tHfBYd0BmxMBQ0d-JN_mcpGCB98Fd4SO_Q&usqp=CAU)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.7 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.3.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.3.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd_install](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.argorollouts_install](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.argocd_rollouts_extension](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_LDAPHost"></a> [LDAPHost](#input\_LDAPHost) | (optional) describe your variable | `string` | `"10.0.0.1"` | no |
| <a name="input_argoAdminPassword"></a> [argoAdminPassword](#input\_argoAdminPassword) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_argoCDEnabled"></a> [argoCDEnabled](#input\_argoCDEnabled) | (optional) describe your variable | `bool` | `true` | no |
| <a name="input_argoCDNamespace"></a> [argoCDNamespace](#input\_argoCDNamespace) | (optional) describe your variable | `string` | `"argocd"` | no |
| <a name="input_argoHost"></a> [argoHost](#input\_argoHost) | (optional) describe your variable | `string` | `"argocd.example.com"` | no |
| <a name="input_argoLDAPPassword"></a> [argoLDAPPassword](#input\_argoLDAPPassword) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_argoRolloutsEnabled"></a> [argoRolloutsEnabled](#input\_argoRolloutsEnabled) | (optional) describe your variable | `bool` | `false` | no |
| <a name="input_argoRolloutsHost"></a> [argoRolloutsHost](#input\_argoRolloutsHost) | (optional) describe your variable | `string` | `"argo-rollouts.example.com"` | no |
| <a name="input_argoRolloutsNamespace"></a> [argoRolloutsNamespace](#input\_argoRolloutsNamespace) | (optional) describe your variable | `string` | `"argo-rollouts"` | no |
| <a name="input_argoUserDN"></a> [argoUserDN](#input\_argoUserDN) | (optional) describe your variable | `string` | `"cn=svc_argocd_github\\,dc=example\\,dc=com"` | no |
| <a name="input_controllerMetricsEnabled"></a> [controllerMetricsEnabled](#input\_controllerMetricsEnabled) | (optional) describe your variable | `bool` | `false` | no |
| <a name="input_controllerReplicas"></a> [controllerReplicas](#input\_controllerReplicas) | Controller replicas | `number` | `3` | no |
| <a name="input_defaultRecipients"></a> [defaultRecipients](#input\_defaultRecipients) | (optional) describe your variable | `map(string)` | <pre>{<br>  "mail": "admin@example.com",<br>  "teams": "default"<br>}</pre> | no |
| <a name="input_extensionsEnabled"></a> [extensionsEnabled](#input\_extensionsEnabled) | (optional) describe your variable | `bool` | `true` | no |
| <a name="input_githubToken"></a> [githubToken](#input\_githubToken) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_githubURL"></a> [githubURL](#input\_githubURL) | n/a | `string` | `"https://github.com/api/v3"` | no |
| <a name="input_harborHelmRepoURL"></a> [harborHelmRepoURL](#input\_harborHelmRepoURL) | n/a | `string` | `"https://harbor.example.com/chartrepo/helm-charts"` | no |
| <a name="input_install_argocd_rollouts_extension"></a> [install\_argocd\_rollouts\_extension](#input\_install\_argocd\_rollouts\_extension) | n/a | `bool` | `true` | no |
| <a name="input_metricsEnabled"></a> [metricsEnabled](#input\_metricsEnabled) | (optional) describe your variable | `bool` | `true` | no |
| <a name="input_repoServerReplicas"></a> [repoServerReplicas](#input\_repoServerReplicas) | Repo Server replicas | `number` | `3` | no |
| <a name="input_serverReplicas"></a> [serverReplicas](#input\_serverReplicas) | Server replicas | `number` | `3` | no |
| <a name="input_serviceEmailSettings"></a> [serviceEmailSettings](#input\_serviceEmailSettings) | n/a | `map(string)` | <pre>{<br>  "from": "argocd@example.com",<br>  "host": "mail.example.com",<br>  "port": "25"<br>}</pre> | no |
| <a name="input_serviceMonitorEnabled"></a> [serviceMonitorEnabled](#input\_serviceMonitorEnabled) | (optional) describe your variable | `bool` | `true` | no |
| <a name="input_serviceTeamsChannels"></a> [serviceTeamsChannels](#input\_serviceTeamsChannels) | n/a | `map(string)` | <pre>{<br>  "default": "<TEAMS WEBHOOK URL>"<br>}</pre> | no |
| <a name="input_slackToken"></a> [slackToken](#input\_slackToken) | (optional) describe your variable | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_install_values"></a> [argocd\_install\_values](#output\_argocd\_install\_values) | n/a |
| <a name="output_argorollouts_install_values"></a> [argorollouts\_install\_values](#output\_argorollouts\_install\_values) | n/a |
<!-- END_TF_DOCS -->