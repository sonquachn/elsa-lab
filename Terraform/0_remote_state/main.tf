locals {
  aws_region = "ap-southeast-1"
  prefix     = "elsa-lab-terraform-remote-state"
  ssm_prefix = "/sonquach/elsa/terraform"
  common_tags = {
    Project   = "elsa-lab"
    ManagedBy = "Terraform"
  }
}
