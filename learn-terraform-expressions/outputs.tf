output "first_tags" {
  value = aws_instance.ubuntu[0].tags
}

# Your configuration contains multiple instances.
# To return the private IP addresses Terraform creates for these instances,
# you will implement a splat * expression as an output.

# The splat expression captures all objects in a
# list that share an attribute.
# The special * symbol iterates over all of the elements of a given list and
# returns information based on the shared attribute you define.
output "private_addresses" {
  value = aws_instance.ubuntu[*].private_dns
}
