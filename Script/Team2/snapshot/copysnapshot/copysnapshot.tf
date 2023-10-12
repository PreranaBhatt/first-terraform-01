module "ebs" {
  source            = "../../../../aws_module/ebs_volume"
  size              = 5
  availability_zone = "us-east-1a"
}

module "ec2" {
  source = "../../../../aws_module/ec2"
  ami    = "ami-053b0d53c279acc90"
}

resource "aws_volume_attachment" "ebs_vol_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_voulume_id
  instance_id = module.ec2.ec2_instanceid
}

module "snapshot" {
  source = "../../../../aws_module/snapshot"
  volume_id =  module.ebs.ebs_voulume_id
}


// need to work on this
# resource "aws_ebs_snapshot_copy" "copySnapshotToanotherRegion" {
#   source_snapshot_id = module.snapshot.output_snapshotId
#   source_region      = "us-east-2"
# }
