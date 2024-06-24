module "ec2_instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  name                        = "jenkins-server"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instancetype
  key_name                    = var.keyname
  monitoring                  = true
  vpc_security_group_ids      = [module.sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  availability_zone           = data.aws_availability_zones.az.names[0]
  user_data                   = file("jenkins-install.sh")

  tags = {
    Name        = "Jenkins-Server"
    Terraform   = "true"
    Environment = "dev"
  }

}