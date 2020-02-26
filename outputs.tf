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
