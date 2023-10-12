module "ebsVolume" {
source = "../../../aws_module/ebs_volume"
availability_zone = "us-east-1a"
size = 2
}

module "snapshot" {
  source = "../../../aws_module/snapshot"
  volume_id = module.ebsVolume.ebs_voulume_id
}