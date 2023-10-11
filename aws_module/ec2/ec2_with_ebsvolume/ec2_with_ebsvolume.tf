resource "aws_ebs_volume" "ebsVolume" {
availability_zone = var.availability_zone
  size              = 40
}


output "ebs_voulume_id" {
  value = aws_ebs_volume.ebsVolume.id
}