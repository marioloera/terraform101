variable "list_1" {
  type    = list(string)
  default = ["a", "b"]
}

variable "list_2" {
  type    = list(string)
  default = ["1", "2"]
}

output "output_concat_lists" {
  # The concat function takes two or more lists and
  # combines them into a single list.
  value = concat(var.list_1, var.list_2)
}
