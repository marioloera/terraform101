# terraform --version

# terraform init
* creates .terraform.lock.hcl with list all the providers 
* creates .terraform dir with the providers

# terraform plan

# terraform apply

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