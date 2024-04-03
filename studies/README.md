# IaC_studies

Studying IaC, Infrastructure as a Code, to improve the Infra maintainability of it

## Terraform

- [Terraform](https://www.terraform.io/)
- [Terraform - AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
  The terraform is a tool to build, change, and version infrastructure safely and efficiently. It can manage existing and popular service providers as well as custom in-house solutions.

### How it works

- Terraform uses HCL (HashiCorp Configuration Language) to define the infrastructure. and we need to declare the providers and resources that we want to use. So it will install it and configure it to the desired state. using the `terraform init` command.

- Then we can use the `terraform plan` command to see the changes that will be made in the infrastructure.

- And finally, we can use the `terraform apply` command to apply the changes. It will create, update or delete the resources to match the desired state, and it will generate a state file to keep track of the resources.
