#####
# Locals
#####

locals {
  labels = {
    "app.kubernetes.io/version"    = var.image_version
    "app.kubernetes.io/component"  = "exporter"
    "app.kubernetes.io/part-of"    = "monitoring"
    "app.kubernetes.io/managed-by" = "terraform"
    "app.kubernetes.io/name"       = "cloudwatch-exporter"
  }
  configuration = yamlencode(var.configuration)
  port          = 9106
  service_port  = 80
  prometheus_alert_groups = [
    {
      "name" = "cloudwatch-exporter"
      "rules" = [
        {
          "alert" = "CloudwatchExporterScrapeErrors"
          "expr"  = "cloudwatch_exporter_scrape_error > 0"
          "for"   = "1m"
          "labels" = merge(
            {
              "severity" = "critical"
              "urgency"  = "2"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Cloudwatch Exporter - Scrape Error on {{ $labels.instance }}",
              "description" = "Cloudwatch Exporter: \n {{ $labels.instance }} scrape error.\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "CloudwatchExporterScrapeDurationError"
          "expr"  = "deriv(cloudwatch_exporter_last_scrape_duration_seconds[2m]) > 0.2 and cloudwatch_exporter_last_scrape_duration_seconds > 10"
          "for"   = "5m"
          "labels" = merge(
            {
              "severity" = "warning"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Cloudwatch Exporter - Scrape Duration Error on {{ $labels.instance }}",
              "description" = "Cloudwatch Exporter:\n {{ $labels.instance }} scrape duration is too high.\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        }
      ]
    }
  ]
}


#####
# Randoms
#####

resource "random_string" "selector" {
  special = false
  upper   = false
  number  = false
  length  = 8
}


#####
# Deployment
#####

resource "kubernetes_deployment" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.deployment_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.deployment_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.deployment_name
      },
      local.labels,
      var.labels,
      var.deployment_labels
    )
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app    = "cloudwatch-exporter"
        random = random_string.selector.result
      }
    }
    template {
      metadata {
        annotations = merge(
          {
            "configuration/hash" = sha256(local.configuration)
          },
          var.annotations,
          var.deployment_template_annotations
        )
        labels = merge(
          {
            "app.kubernetes.io/instance" = var.deployment_name
            app                          = "cloudwatch-exporter"
            random                       = random_string.selector.result
          },
          local.labels,
          var.labels,
          var.deployment_template_labels
        )
      }
      spec {
        automount_service_account_token = false
        container {
          name              = "cloudwatch-exporter"
          image             = "${var.image_name}:${var.image_version}"
          image_pull_policy = var.image_pull_policy

          env {
            name = "AWS_ACCESS_KEY_ID"
            value_from {
              secret_key_ref {
                name = element(concat(kubernetes_secret.this.*.metadata.0.name, [""]), 0)
                key  = "access_key"
              }
            }
          }

          env {
            name = "AWS_SECRET_ACCESS_KEY"
            value_from {
              secret_key_ref {
                name = element(concat(kubernetes_secret.this.*.metadata.0.name, [""]), 0)
                key  = "secret_key"
              }
            }
          }

          readiness_probe {
            http_get {
              path   = "/"
              port   = local.port
              scheme = "HTTP"
            }

            timeout_seconds       = 5
            period_seconds        = 10
            success_threshold     = 1
            failure_threshold     = 20
            initial_delay_seconds = 90
          }

          liveness_probe {
            http_get {
              path   = "/"
              port   = local.port
              scheme = "HTTP"
            }

            timeout_seconds       = 5
            period_seconds        = 10
            success_threshold     = 1
            failure_threshold     = 3
            initial_delay_seconds = 300
          }

          port {
            name           = "http"
            container_port = local.port
            protocol       = "TCP"
          }

          resources {
            requests = {
              memory = var.memory_request
              cpu    = var.cpu_request
            }
            limits = {
              memory = var.memory_limit
              cpu    = var.cpu_limit
            }
          }

          volume_mount {
            name       = "configuration"
            mount_path = "/config/config.yml"
            sub_path   = "config.yml"
          }
        }

        volume {
          name = "configuration"
          config_map {
            name = element(concat(kubernetes_config_map.this.*.metadata.0.name, [""]), 0)
            items {
              key  = "config.yml"
              path = "config.yml"
            }
          }
        }
      }
    }
  }
}


#####
# Secret
#####

resource "kubernetes_secret" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.secret_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.secret_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.secret_name
      },
      local.labels,
      var.labels,
      var.secret_labels
    )
  }

  data = {
    access_key = var.access_key
    secret_key = var.secret_key
  }

  type = "Opaque"
}


#####
# Service
#####

resource "kubernetes_service" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.service_name
    namespace = var.namespace
    annotations = merge(
      {
        "prometheus.io/scrape" = "true"
      },
      var.annotations,
      var.service_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.service_name
      },
      local.labels,
      var.labels,
      var.service_labels
    )
  }

  spec {
    selector = {
      random = random_string.selector.result
      app    = "cloudwatch-exporter"
    }
    type = "ClusterIP"
    port {
      port        = local.service_port
      target_port = "http"
      protocol    = "TCP"
      name        = "http"
    }
  }
}


#####
# ConfigMap
#####

resource "kubernetes_config_map" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.config_map_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.config_map_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.config_map_name
      },
      local.labels,
      var.labels,
      var.config_map_labels
    )
  }

  data = {
    "config.yml" = local.configuration
  }
}
