# terraform-module-kubernetes-cloudwatch-exporter (default example)

## Usage

To run this example, you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_default"></a> [default](#module\_default) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [random_string.default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Client ID that will be used by the snapshot-manager. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | Client secret that will be used by the snapshot-manager. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_map_annotations"></a> [config\_map\_annotations](#output\_config\_map\_annotations) | Map of annotations that are configured on the config\_map. |
| <a name="output_config_map_labels"></a> [config\_map\_labels](#output\_config\_map\_labels) | Map of labels that are configured on the config\_map. |
| <a name="output_config_map_name"></a> [config\_map\_name](#output\_config\_map\_name) | Name of the config\_map created by the module. |
| <a name="output_deployment_annotations"></a> [deployment\_annotations](#output\_deployment\_annotations) | Map of annotations that are configured on the deployment. |
| <a name="output_deployment_labels"></a> [deployment\_labels](#output\_deployment\_labels) | Map of labels that are configured on the deployment. |
| <a name="output_deployment_name"></a> [deployment\_name](#output\_deployment\_name) | Name of the deployment created by the module. |
| <a name="output_deployment_template_annotations"></a> [deployment\_template\_annotations](#output\_deployment\_template\_annotations) | Map of annotations that are configured on the deployment. |
| <a name="output_deployment_template_labels"></a> [deployment\_template\_labels](#output\_deployment\_template\_labels) | Map of labels that are configured on the deployment. |
| <a name="output_image_name"></a> [image\_name](#output\_image\_name) | Name of the docker image used for the cloudwatch-exporter container. |
| <a name="output_image_pull_policy"></a> [image\_pull\_policy](#output\_image\_pull\_policy) | Image pull policy defined on the cloudwatch-exporter container. |
| <a name="output_image_version"></a> [image\_version](#output\_image\_version) | Tag of the docker image used for the cloudwatch-exporter container. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Name of the namespace in which the resources have been deployed. |
| <a name="output_prometheus_alert_groups"></a> [prometheus\_alert\_groups](#output\_prometheus\_alert\_groups) | List of maps representing prometheus alert groups. |
| <a name="output_secret_annotations"></a> [secret\_annotations](#output\_secret\_annotations) | Map of annotations that are configured on the secret. |
| <a name="output_secret_labels"></a> [secret\_labels](#output\_secret\_labels) | Map of labels that are configured on the secret. |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | Name of the secret created by the module. |
| <a name="output_selector_labels"></a> [selector\_labels](#output\_selector\_labels) | Map of the labels that are used as selectors. |
| <a name="output_service_annotations"></a> [service\_annotations](#output\_service\_annotations) | Map of annotations that are configured on the service. |
| <a name="output_service_labels"></a> [service\_labels](#output\_service\_labels) | Map of labels that are configured on the service. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the service created by the module. |
| <a name="output_service_port"></a> [service\_port](#output\_service\_port) | Port number of the service port. |
| <a name="output_service_port_name"></a> [service\_port\_name](#output\_service\_port\_name) | Name of the service port. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
