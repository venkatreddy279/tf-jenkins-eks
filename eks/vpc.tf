module "vpc" {
    source = "terraform-aws-modules/vpc/aws"


    name = "myvpc"
    cidr =  var.vpc_cidr
    azs             = data.aws_availability_zones.azs.names
    private_subnets = var.privatesubnets
    public_subnets  = var.publicsubnets

    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true

    tags = {
   "kubernetes.io/cluster/my-eks-cluster" = "shared"
    }
    public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = "1"
    }

    private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = "1"
    }

  
}