# Learn Terraform Code Organization

Learn best practices for Terraform as your organization grows. Split a Dev & Prod environment and compose shared modules.

Follow along with the [Learn guide](https://learn.hashicorp.com/tutorials/terraform/organize-configuration?in=terraform/modules) at HashiCorp Learn.

# workspaces

Workspace-separated environments use the same Terraform code but have different state files, which is useful if you want your environments to stay as similar to each other as possible, for example if you are providing development infrastructure to a team that wants to simulate running in production.

However, you must manage your workspaces in the CLI and be aware of the workspace you are working in to avoid accidentally performing operations on the wrong environment.

When you use the default workspace with the local backend, your terraform.tfstate file is stored in the root directory of your Terraform project. When you add additional workspaces your state location changes; Terraform internals manage and store state files in the directory terraform.tfstate.d.

Your directory will look similar to the one below.
```
.
├── README.md
├── assets
│   └── index.html
├── terraform.tfstate.d
│   ├── dev
│   │   └── terraform.tfstate
│   ├── prod
│   │   └── terraform.tfstate
├── dev.tfvars
├── main.tf
├── outputs.tf
├── prod.tfvars
├── terraform.tfstate
└── variables.tf
```

```
terraform workspace new dev
terrafrom init
terraform workspace list
terraform apply -var-file=dev.tfvars
terraform destroy -var-file=dev.tfvars
terraform workspace select other_workspace
```
