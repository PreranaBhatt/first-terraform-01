# module "Iam_User" {
#   source = "../../../aws_module/users"
#    name = "devPrerana"
# }

//creating multiple user
module "Iam_multipleUser" {
  source = "../../../aws_module/users"
  name = ["user1","user2","user3"]
}