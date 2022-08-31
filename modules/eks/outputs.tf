output "endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}
output "cluster_id" {
  value = aws_eks_cluster.example.id
}
output "cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}
output "cluster_name" {
  value = aws_eks_cluster.example.name
}
