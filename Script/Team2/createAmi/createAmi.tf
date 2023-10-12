
module "ebsVolume" {
source = "../../../aws_module/ebs_volume"
availability_zone = "us-east-1a"
size = 2
}

module "snapshot" {
  source = "../../../aws_module/snapshot"
  volume_id = module.ebsVolume.ebs_voulume_id
}

// to create ami
resource "aws_ami" "example" {
  name                = "team2_test_ami"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  imds_support        = "v2.0" # Enforce usage of IMDSv2. You can safely remove this line if your application explicitly doesn't support it.
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = module.snapshot.output_snapshotId
  }
}