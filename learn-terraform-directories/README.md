# Learn Terraform Code Organization

Learn best practices for Terraform as your organization grows. Split a Dev & Prod environment and compose shared modules.

Follow along with the [Learn guide](https://learn.hashicorp.com/terraform/modules/code-org-envs) at HashiCorp Learn.


# Directories
By creating separate directories for each environment, you can shrink the blast radius of your Terraform operations and ensure you will only modify intended infrastructure. Terraform stores your state files on disk in their corresponding configuration directories. Terraform operates only on the state and configuration in the working directory by default.

```
.
├── assets
│   ├── index.html
├── prod
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfstate
│   └── terraform.tfvars
|   ├── outputs.tf
└── dev
   ├── main.tf
   ├── variables.tf
   ├── terraform.tfstate
   └── terraform.tfvars
   ├── outputs.tf
```
