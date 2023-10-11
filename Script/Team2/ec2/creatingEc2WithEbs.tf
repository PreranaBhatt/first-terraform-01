module "ebs" {
  source            = "../../../aws_module/ec2/ec2_with_ebsvolume"
  size              = 5
  availability_zone = "us-east-1a"
}

module "ec2" {
  source = "../../../aws_module/ec2"
  ami    = "ami-053b0d53c279acc90"
}


resource "aws_volume_attachment" "ebs_vol_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_voulume_id
  instance_id = module.ec2.ec2_instanceid
}