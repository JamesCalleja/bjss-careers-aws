output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "node_role_arn" {
  value = aws_iam_role.eks_node.arn
}


output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_version" {
  value = module.eks.cluster_version
}

output "cluster_name" {
  value = module.eks.cluster_name
}