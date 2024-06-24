module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.30"

  cluster_endpoint_public_access  = true


  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  # EKS Managed Node Group(s)
  
  eks_managed_node_groups = {
    nodes = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      instance_types = ["t2.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}