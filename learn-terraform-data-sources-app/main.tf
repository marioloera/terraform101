terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# You can use the terraform_remote_state data source to use another
# Terraform workspace's output data.
# Tip: We recommend using provider-specific data sources when convenient.
# terraform_remote_state is more flexible,
# but requires access to the whole Terraform state.
data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../learn-terraform-data-sources-vpc/terraform.tfstate"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

provider "aws" {
  # region = "us-east-1"
  # Replace the hard-coded region configuration in main.tf
  #  with the region output from the VPC workspace.
  region = data.terraform_remote_state.vpc.outputs.aws_region

}

resource "random_string" "lb_id" {
  length  = 3
  special = false
}

module "elb_http" {
  source  = "terraform-aws-modules/elb/aws"
  version = "2.4.0"

  # Ensure load balancer name is unique
  name = "lb-${random_string.lb_id.result}-tutorial-example"

  internal = false

  security_groups = data.terraform_remote_state.vpc.outputs.lb_security_group_ids
  subnets         = data.terraform_remote_state.vpc.outputs.public_subnet_ids

  number_of_instances = length(aws_instance.app)
  instances           = aws_instance.app.*.id

  listener = [{
    instance_port     = "80"
    instance_protocol = "HTTP"
    lb_port           = "80"
    lb_protocol       = "HTTP"
  }]

  health_check = {
    target              = "HTTP:80/index.html"
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
  }
}

resource "aws_instance" "app" {
  # Update the configuration to use multiple EC2 instances per subnet.
  count = var.instances_per_subnet * length(data.terraform_remote_state.vpc.outputs.private_subnet_ids)

  # ami = "ami-04d29b6f966df1537"
  # Replace the hard-coded AMI ID with the one loaded from the new data source.
  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  # update the EC2 instance configuration to use the subnet and security group configuration from the VPC workspace.
  subnet_id              = data.terraform_remote_state.vpc.outputs.private_subnet_ids[count.index % length(data.terraform_remote_state.vpc.outputs.private_subnet_ids)]
  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.app_security_group_ids


  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<html><body><div>Hello, world!</div></body></html>" > /var/www/html/index.html
    EOF
}
