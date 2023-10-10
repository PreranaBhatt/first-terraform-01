variable "ami" {
  type = string
  
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "subnet_id" {
  type = string
}

