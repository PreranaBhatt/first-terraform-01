//securityGroup
resource "aws_security_group" "SG" {
  name        = "securityGroup"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  
  dynamic "ingress" {
     for_each = [22,443,80]
           iterator = port
    content {
       description      = "TLS from VPC"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }
 
 tags = {
    Name = "security_G"
  }
}

output "output_security_group_id" {
    value = aws_security_group.SG.id
}