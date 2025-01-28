module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.10.0"

  cluster_name                             = "${local.prefix}-cluster"
  cluster_version                          = "1.31"
  cluster_endpoint_public_access           = true
  cluster_enabled_log_types                = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  subnet_ids                               = var.subnet_ids
  enable_cluster_creator_admin_permissions = true
  cloudwatch_log_group_retention_in_days   = 7

  cluster_security_group_additional_rules = {
    ingress_vpc_https = {
      description = "Allow all tcp trafic betwean nodes"
      protocol    = "tcp"
      from_port   = 1
      to_port     = 65535
      type        = "ingress"
      cidr_blocks = [var.cidr]
    }
  }



  eks_managed_node_groups = {
    general = {
      capacity_type  = "SPOT"
      instance_types = ["t3.small"]
      desired_size   = "1"
      max_size       = "3"
      min_size       = "1"

    }
  }
}
