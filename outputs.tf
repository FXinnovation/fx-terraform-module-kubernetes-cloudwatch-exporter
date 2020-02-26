#####
# Global
#####

output "label_selectors" {
  description = "Map of the labels that are used as selectors."
  value       = element(concat(kubernetes_service.this.*.spec.0.selector, [{}]), 0)
}

#####
# Deployment
#####

output "deployment_name" {
  description = "Name of the deployment created by the module."
  value       = element(concat(kubernetes_deployment.this.*.metadata.0.name, [""]), 0)
}

#####
# Sercret
#####

output "secret_name" {
  description = "Name of the secret created by the module."
  value       = element(concat(kubernetes_secret.this.*.metadata.0.name, [""]), 0)
}

#####
# Service
#####

output "service_name" {
  description = "Name of the service created by the module."
  value       = element(concat(kubernetes_service.this.*.metadata.0.name, [""]), 0)
}

output "service_port" {
  description = "Port number of the service port."
  value       = var.enabled ? local.service_port : ""
}

output "service_port_name" {
  description = "Name of the service port."
  value       = var.enabled ? "http" : ""
}

#####
# Configmap
#####

output "config_map_name" {
  description = "Name of the config_map created by the module."
  value       = element(concat(kubernetes_config_map.this.*.metadata.0.name, [""]), 0)
}

#####
# Namespace
#####

output "namespace" {
  description = "Name of the namespace in which the resources have been deployed."
  value       = element(concat(kubernetes_deployment.this.*.metadata.0.namespace, [""]), 0)
}
