# terraform-module-kubernetes-cloudwatch-exporter

Terraform module to deploy [cloudwatch_exporter](https://github.com/prometheus/cloudwatch_exporter) on kubernetes.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_config_map.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [random_string.selector](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Client ID that will be used by the cloudwatch-exporter. | `string` | n/a | yes |
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additionnal annotations that will be merged on all resources. | `map` | `{}` | no |
| <a name="input_config_map_annotations"></a> [config\_map\_annotations](#input\_config\_map\_annotations) | Additionnal annotations that will be merged for the config map. | `map` | `{}` | no |
| <a name="input_config_map_labels"></a> [config\_map\_labels](#input\_config\_map\_labels) | Additionnal labels that will be merged for the config map. | `map` | `{}` | no |
| <a name="input_config_map_name"></a> [config\_map\_name](#input\_config\_map\_name) | Name of the config map that will be created. | `string` | `"cloudwatch-exporter"` | no |
| <a name="input_configuration"></a> [configuration](#input\_configuration) | Object representating the yaml configuration for cloudwatch-exporter. | `any` | n/a | yes |
| <a name="input_cpu_limit"></a> [cpu\_limit](#input\_cpu\_limit) | Maximum amount of cpu that can be used by the pod. | `string` | `"500m"` | no |
| <a name="input_cpu_request"></a> [cpu\_request](#input\_cpu\_request) | Amount of cpu to request at pod startup. | `string` | `"300m"` | no |
| <a name="input_deployment_annotations"></a> [deployment\_annotations](#input\_deployment\_annotations) | Additionnal annotations that will be merged on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_labels"></a> [deployment\_labels](#input\_deployment\_labels) | Additionnal labels that will be merged on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment that will be create. | `string` | `"cloudwatch-exporter"` | no |
| <a name="input_deployment_template_annotations"></a> [deployment\_template\_annotations](#input\_deployment\_template\_annotations) | Additionnal annotations that will be merged on the deployment template. | `map` | `{}` | no |
| <a name="input_deployment_template_labels"></a> [deployment\_template\_labels](#input\_deployment\_template\_labels) | Additionnal labels that will be merged on the deployment template. | `map` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not to enable this module. | `bool` | `true` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of the docker image to use. | `string` | `"prom/cloudwatch-exporter"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Image pull policy on the main container. | `string` | `"IfNotPresent"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Tag of the docker image to use. | `string` | `"latest"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Additionnal labels that will be merged on all resources. | `map` | `{}` | no |
| <a name="input_memory_limit"></a> [memory\_limit](#input\_memory\_limit) | Maximum amount of memory that can be used by the pod. | `string` | `"512Mi"` | no |
| <a name="input_memory_request"></a> [memory\_request](#input\_memory\_request) | Amount of memory to request at pod startup. | `string` | `"256Mi"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace in which the module will be deployed. | `string` | `"default"` | no |
| <a name="input_prometheus_alert_groups_rules_annotations"></a> [prometheus\_alert\_groups\_rules\_annotations](#input\_prometheus\_alert\_groups\_rules\_annotations) | Map of strings that will be merge on all prometheus alert groups rules annotations. | `map` | `{}` | no |
| <a name="input_prometheus_alert_groups_rules_labels"></a> [prometheus\_alert\_groups\_rules\_labels](#input\_prometheus\_alert\_groups\_rules\_labels) | Map of strings that will be merge on all prometheus alert groups rules labels. | `map` | `{}` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas to deploy. | `number` | `1` | no |
| <a name="input_secret_annotations"></a> [secret\_annotations](#input\_secret\_annotations) | Additionnal annotations that will be merged for the secret. | `map` | `{}` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Client secret that will be used by the cloudwatch-exporter. | `string` | n/a | yes |
| <a name="input_secret_labels"></a> [secret\_labels](#input\_secret\_labels) | Additionnal labels that will be merged for the secret. | `map` | `{}` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of the secret that will be created. | `string` | `"cloudwatch-exporter"` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Additionnal annotations that will be merged for the service. | `map` | `{}` | no |
| <a name="input_service_labels"></a> [service\_labels](#input\_service\_labels) | Additionnal labels that will be merged for the service. | `map` | `{}` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service that will be create | `string` | `"cloudwatch-exporter"` | no |

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
| <a name="output_prometheus_alert_groups"></a> [prometheus\_alert\_groups](#output\_prometheus\_alert\_groups) | List of object representing prometheus alert groups you can import in prometheus to alert you in case of problems. |
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
