module "vpc" {
  source = "terraform-aws-modules/vpc/aws"


  name            = "myvpc"
  cidr            = var.vpc_cidr
  azs             = data.aws_availability_zones.az.names
  private_subnets = var.privatesubnets
  public_subnets  = var.publicsubnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"

  }


}