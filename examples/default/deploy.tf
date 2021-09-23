#####
# Randoms
#####

resource "random_string" "default" {
  upper   = false
  number  = false
  special = false
  length  = 8
}


#####
# Datasources
#####

data "azurerm_kubernetes_cluster" "this" {
  name                = "prometheusplusplus-stg0"
  resource_group_name = "prometheusplusplus-stg0"
}


#####
# Context
#####

resource "kubernetes_namespace" "default" {
  metadata {
    name = random_string.default.result
  }
}


#####
# default example
#####

module "default" {
  source = "../.."

  namespace  = kubernetes_namespace.default.metadata.0.name
  access_key = "fake_key"
  secret_key = "fake_secret"
  configuration = {
    region = "us-east-1"
    metrics = [{
      aws_namespace   = "AWS/ApplicationELB"
      aws_metric_name = "RequestCound"
      aws_dimensions  = ["LoadBalancer", "TargetGroup"]
      aws_tag_select = {
        resource_type_selection = "elasticloadbalancing:loadbalancer/app"
        resource_id_dimension   = "LoadBalancer"
        aws_statistics          = ["Average"]
      }
    }]
  }
}
