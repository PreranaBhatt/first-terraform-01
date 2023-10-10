# resource "aws_iam_user" "Admin" {
#   name = var.name
#   tags = {
#     tag-key = var.name
#   }
# }


resource "aws_iam_user" "User" {
  count = length(var.name)
  name = var.name[count.index]

  tags = {
    tag-key = var.name[count.index]
  }
}