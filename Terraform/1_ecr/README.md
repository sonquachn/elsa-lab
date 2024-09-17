# Terraform
cd dev-ecr
terraform init
terraform validate
terraform plan -out state.tfplan
terraform apply state.tfplan

# ecr name

variables.auto.tfvars

ecr_name = [
  "hackathons-fe",
  "hackathons-be"
]