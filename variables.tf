#####
# Global
#####

variable "annotations" {
  description = "Additionnal annotations that will be merged on all resources."
  default     = {}
}

variable "enabled" {
  description = "Whether or not to enable this module."
  default     = true
}

variable "labels" {
  description = "Additionnal labels that will be merged on all resources."
  default     = {}
}

variable "namespace" {
  description = "Namespace in which the module will be deployed."
  default     = "default"
}

#####
# Prometheus
#####

variable "prometheus_alert_groups_rules_labels" {
  description = "Map of strings that will be merge on all prometheus alert groups rules labels."
  default     = {}
}

variable "prometheus_alert_groups_rules_annotations" {
  description = "Map of strings that will be merge on all prometheus alert groups rules annotations."
  default     = {}
}

#####
# Application
#####

variable "access_key" {
  description = "Client ID that will be used by the cloudwatch-exporter."
  type        = string
}

variable "secret_key" {
  description = "Client secret that will be used by the cloudwatch-exporter."
  type        = string
}

variable "configuration" {
  description = "Object representating the yaml configuration for cloudwatch-exporter."
  type        = any
}

#####
# Deployment
#####

variable "deployment_annotations" {
  description = "Additionnal annotations that will be merged on the deployment."
  default     = {}
}

variable "deployment_labels" {
  description = "Additionnal labels that will be merged on the deployment."
  default     = {}
}

variable "deployment_name" {
  description = "Name of the deployment that will be create."
  default     = "cloudwatch-exporter"
}

variable "deployment_template_annotations" {
  description = "Additionnal annotations that will be merged on the deployment template."
  default     = {}
}

variable "deployment_template_labels" {
  description = "Additionnal labels that will be merged on the deployment template."
  default     = {}
}

variable "image_name" {
  description = "Name of the docker image to use."
  default     = "prom/cloudwatch-exporter"
}

variable "image_pull_policy" {
  description = "Image pull policy on the main container."
  default     = "IfNotPresent"
}

variable "image_version" {
  description = "Tag of the docker image to use."
  default     = "latest"
}

variable "replicas" {
  description = "Number of replicas to deploy."
  default     = 1
}

variable "cpu_request" {
  description = "Amount of cpu to request at pod startup."
  default     = "300m"
}

variable "cpu_limit" {
  description = "Maximum amount of cpu that can be used by the pod."
  default     = "500m"
}

variable "memory_request" {
  description = "Amount of memory to request at pod startup."
  default     = "256Mi"
}

variable "memory_limit" {
  description = "Maximum amount of memory that can be used by the pod."
  default     = "512Mi"
}

#####
# Service
#####

variable "service_annotations" {
  description = "Additionnal annotations that will be merged for the service."
  default     = {}
}

variable "service_labels" {
  description = "Additionnal labels that will be merged for the service."
  default     = {}
}

variable "service_name" {
  description = "Name of the service that will be create"
  default     = "cloudwatch-exporter"
}

#####
# Secret
#####

variable "secret_annotations" {
  description = "Additionnal annotations that will be merged for the secret."
  default     = {}
}

variable "secret_labels" {
  description = "Additionnal labels that will be merged for the secret."
  default     = {}
}

variable "secret_name" {
  description = "Name of the secret that will be created."
  default     = "cloudwatch-exporter"
}

#####
# Config Map
#####

variable "config_map_annotations" {
  description = "Additionnal annotations that will be merged for the config map."
  default     = {}
}

variable "config_map_labels" {
  description = "Additionnal labels that will be merged for the config map."
  default     = {}
}

variable "config_map_name" {
  description = "Name of the config map that will be created."
  default     = "cloudwatch-exporter"
}
