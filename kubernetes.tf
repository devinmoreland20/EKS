# resource "kubernetes_deployment" "nginx" {
#   metadata {
#     name = "scalable-nginx-example"
#     labels = {
#       App = "ScalableNginxExample"
#     }
#   }

#   spec {
#     replicas = 2
#     selector {
#       match_labels = {
#         App = "ScalableNginxExample"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           App = "ScalableNginxExample"
#         }
#       }
#       spec {
#         container {
#           image = "nginx:1.7.8"
#           name  = "example"

#           port {
#             container_port = 80
#           }

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

# # resource "kubernetes_cluster_role" "example" {
# #   metadata {
# #     name = "terraform-example"
# #   }

# #   rule {
# #     api_groups = ["apps", "extensions"]
# #     resources  = ["deployments"]
# #     verbs      = ["get", "list", "watch"]
# #   }
# # }


# # resource "kubernetes_cluster_role_binding" "example" {
# #   metadata {
# #     name = "terraform-example"
# #   }
# #   role_ref {
# #     api_group = "rbac.authorization.k8s.io"
# #     kind      = "ClusterRole"
# #     name      = "cluster-admin"
# #   }
# #   subject {
# #     kind      = "User"
# #     name      = "admin"
# #     api_group = "rbac.authorization.k8s.io"
# #   }
# #   subject {
# #     kind      = "ServiceAccount"
# #     name      = "default"
# #     namespace = "kube-system"
# #   }
# #   subject {
# #     kind      = "Group"
# #     name      = "system:masters"
# #     api_group = "rbac.authorization.k8s.io"
# #   }
# # }
