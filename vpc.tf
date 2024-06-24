module "vpc" {
    source = "terraform-aws-modules/vpc/aws"


    name = "myvpc"
    cidr =  var.vpc_cidr
    azs             = data.aws_availability_zones.az.names
    private_subnets = var.privatesubnets
    public_subnets  = var.publicsubnets

    enable_nat_gateway = true
    single_nat_gateway = true
    map_public_ip_on_launch = true
    enable_dns_hostnames = true

    tags = {
    Terraform   = "true"
    Environment = "dev"

    }

  
}