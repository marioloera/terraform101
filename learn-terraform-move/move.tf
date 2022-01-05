moved {
  from = aws_instance.example
  to   = module.ec2_instance.aws_instance.example
}

moved {
  from = aws_security_group.sg_8080
  to   = module.security_group.aws_security_group.sg_8080
}
