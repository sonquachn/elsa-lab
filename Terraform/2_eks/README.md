<!-- BEGIN_TF_DOCS -->
# Terraform remote state

This module deploys AWS infrastructure to store Terraform remote state in S3 bucket and lock Terraform execution in DynamoDB table.

## Deployment

```sh
terraform init
terraform plan -out state.tfplan
terraform apply state.tfplan
```
<!-- END_TF_DOCS -->