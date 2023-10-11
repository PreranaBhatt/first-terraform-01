resource "aws_instance" "ec2" {
  instance_type =var.instance_type
  ami= var.ami
}

output "ec2_instanceid" {
  value = aws_instance.ec2.id
}