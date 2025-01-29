data "aws_eks_cluster_auth" "main" {
  name = "${local.prefix}-cluster"
}


#TODO https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#stacking-with-managed-kubernetes-cluster-resources
#TODO This is a potential for a race condition and agaist hashicorp best practices