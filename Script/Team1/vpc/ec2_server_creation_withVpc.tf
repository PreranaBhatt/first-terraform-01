module "vpc" {
  source     = "../../../aws_module/vpc"
  cidr_block = "10.10.0.0/16"
}

module "security_Group" {
  depends_on = [module.vpc]
  source     = "../../../aws_module/securityGroup"
  vpc_id     = module.vpc.output_vpc_id
}

module "ec2_withVpc" {
  source                 = "../../../aws_module/ec2/ec2_withvpc"
  ami                    = "ami-04cb4ca688797756f"
  vpc_security_group_ids = [module.security_Group.output_security_group_id]
  subnet_id              = module.vpc.output_vpc_subnet_id
}