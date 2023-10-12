resource "aws_ebs_snapshot" "ebs_snapshot" {
  volume_id = var.volume_id
  tags = {
    Name = "HelloWorld_snap"
  }
}

output "output_snapshotId" {
  value = aws_ebs_snapshot.ebs_snapshot.id
}
