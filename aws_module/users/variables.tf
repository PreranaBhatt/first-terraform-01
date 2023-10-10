# variable "name"{
#   type = string
# }

variable "name"{
  description = "to create multiple user"
  type = list(string)
}