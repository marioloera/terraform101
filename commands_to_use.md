# terraform --version

# terraform init
* creates .terraform.lock.hcl with list all the providers 
* creates .terraform dir with the providers

# terraform plan

# terraform apply

* passing variables values
```
terraform apply -var "content=FIFA 2021" -var "filename=./test01.txt"
```

* adding evironmental variables
```
export TF_VAR_content="mario2"
terraform apply
```

# terraform destroy

# terraform state list
# terraform state show local_file.games
uses the content in terraform.tfstate
