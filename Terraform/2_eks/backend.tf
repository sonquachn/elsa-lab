terraform {
  backend "s3" {
    bucket         = "elsa-lab-terraform-remote-state-s3"
    dynamodb_table = "elsa-lab-terraform-remote-state-dynamodb"
    key            = "terraform-remote-state.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
