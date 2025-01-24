module "aws_auth_configmap" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "~> 20.0"

  depends_on = [
    module.eks
  ]

  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "${aws_iam_role.eks_node.arn}"
      username = "{{EC2PrivateDNSName}}"
      groups   = ["system:node", "system:bootstrappers"]
    },
    {
      rolearn  = "${var.identifiers.account_admin_role_simple_arn}"
      username = "kubectl-access-user"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "${var.identifiers.app_deployer_role_arn}"
      username = "kubectl-access-deploy"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "${var.identifiers.candidates_role_arn}"
      username = "adminaccess"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "${data.terraform_remote_state.source_state.outputs.terraform_runner_role_arn}"
      username = "kubectl-access-candidate"
      groups   = ["system:masters"]
    }
  ]
}
