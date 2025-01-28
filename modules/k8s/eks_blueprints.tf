module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "1.16.3"

  cluster_name      = data.terraform_remote_state.source_state.outputs.cluster_name
  cluster_endpoint  = data.terraform_remote_state.source_state.outputs.cluster_endpoint
  cluster_version   = data.terraform_remote_state.source_state.outputs.cluster_version
  oidc_provider_arn = data.terraform_remote_state.source_state.outputs.oidc_provider_arn

  eks_addons = {
    aws-ebs-csi-driver = {
      most_recent = false
    }
    coredns = {
      most_recent = false
    }
    vpc-cni = {
      most_recent = false
    }
    kube-proxy = {
      most_recent = false
    }
  }

  # K8s Add-ons
  enable_aws_for_fluentbit            = false
  enable_aws_cloudwatch_metrics       = false
  enable_cert_manager                 = false
  enable_external_secrets             = false
  enable_aws_load_balancer_controller = false
  enable_karpenter                    = false

  aws_for_fluentbit = {
    enable_containerinsights = false
  }
}
