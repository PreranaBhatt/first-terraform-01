variable availability_zone{
    type = string
    description = "AZ where the EBS volume will exist"
}

variable "size" {
  type = number
  description = "size of ebs disk"
}

# variable "tags" {
#   type = map(list)
# }