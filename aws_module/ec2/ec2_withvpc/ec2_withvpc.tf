resource "aws_instance" "ec2_customised" {
  instance_type = var.instance_type
  ami= var.ami
  key_name = "keyPair"
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
}