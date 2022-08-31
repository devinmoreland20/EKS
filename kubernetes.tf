# resource "kubernetes_deployment" "example" {
#   metadata {
#     name = "terraform-example"
#     labels = {
#       test = "MyExampleApp"
#     }
#   }

#   spec {
#     replicas = 2
#     selector {
#       match_labels = {
#         test = "MyExampleApp"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           test = "MyExampleApp"
#         }
#       }
#       spec {
#         container {
#           image = "nginx:1.7.8"
#           name  = "example"

#           resources {
#             limits = {
#               cpu    = "0.5"
#               memory = "512Mi"
#             }
#             requests = {
#               cpu    = "250m"
#               memory = "50Mi"
#             }
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "example" {
#   metadata {
#     name = "terraform-example"
#   }

#   spec {
#     selector = {
#       test = "myExampleApp"
#     }
#     port {
#       port        = 80
#       target_port = 80
#       node_port   = 30010
#     }

#     type = "LoadBalancer"
#   }
# }
