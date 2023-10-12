module "ebsVolume" {
source = "../../../aws_module/ec2/ec2_with_ebsvolume"
availability_zone = "us-east-1a"
size = 2
}

module "snapshot" {
  source = "../../../aws_module/snapshot"
  volume_id = module.ebsVolume.ebs_voulume_id
}