# terraform --version

# terraform init
* creates .terraform.lock.hcl with list all the providers
* creates .terraform dir with the providers

## terraform init -upgrade
The -upgrade flag will upgrade all providers to the latest version consistent within the version constraints previously established in your configuration.

# terraform plan

# terraform apply -auto-approve
## how to give values to varaibles:
1. passing variables values in cli
```
terraform apply -var "content=FIFA 2021" -var "filename=./test01.txt"
```
1. adding evironmental variables
```
export TF_VAR_content="mario2"
```
1. adding file terraform.tfvars
1. adding file terraform.tfvars.json

* seems tfvars files have higer priority than environmen variables, but you can specify a variables file:
```
 terraform apply -var-file=terraform.tfvars.json
 or
 terraform apply -var-file=foo.json
```
# terraform destroy

# terraform state list
# terraform state show local_file.games
uses the content in terraform.tfstate

# terraform state rm
removes specific resources from your state file. This does not remove the resource from your configuration or destroy the infrastructure itself.
```
terraform state rm aws_security_group.sg_8080
```

# terraform fmt -recursive
automatically updates configurations files in the current directory for readability and consistency.

# terraform validate
make sure your configuration is syntactically valid and internally consistent.

# terraform output
Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use.
You can use Terraform outputs to connect your Terraform projects with other parts of your infrastructure, or with other Terraform projects
```
terraform output ip
terraform output -raw ip
terraform output -json
```

# terraform console
interactive console that you can use to evaluate expressions in the context of your configuration. This can be very useful when working with and troubleshooting variable definitions.
```
    variable "resource_tags" {
      type        = map(string)
      default = {
        project     = "project-alpha",
        environment = "dev"
      }
    }

    variable "public_subnet_cidr_blocks" {
      type        = list(string)
      default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24",
      ]
    }

```

```
    var.private_subnet_cidr_blocks[1]
    slice(var.private_subnet_cidr_blocks, 0, 3)
    var.resource_tags["environment"]
```

# terraform import
Now run terraform import to attach the existing Docker container to the docker_container.web resource you just created. Terraform import requires this Terraform resource ID and the full Docker container ID. In the following example, the command docker inspect --format="{{.ID}}" hashicorp-learn returns the full SHA256 container ID.
```
terraform import docker_container.web $(docker inspect --format="{{.ID}}" hashicorp-learn)
```

# -target flag for terraform plan and terraform apply
The -target flag allows you to target specific resources and avoid destroying all the resources in your workspace just to fix one of them.
```
terraform plan -target="aws_instance.example"
```

# -refresh-only flag for terraform plan and terraform apply
The -refresh-only mode for terraform plan and terraform apply operations makes it safer to check Terraform state against real infrastructure by letting you review proposed changes to the state file. It lets you avoid mistakenly removing an existing resource from state and gives you a chance to correct your configuration.
```
terraform plan -refresh-only
```

# terraform get
to install new modules.

# terraform workspace list
Terraform print out the list of your workspaces with the currently selected one denoted by a *.

* Create a new 'dev' workspace in the Terraform CLI with the workspace command.

```
terraform workspace new dev
terrafrom init
terraform workspace list
terraform apply -var-file=dev.tfvars
terraform destroy -var-file=dev.tfvars
terraform workspace select other_workspace
```
