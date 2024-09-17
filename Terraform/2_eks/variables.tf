#variable "aws_access_key" {
#  description = "AWS access key"
#  type        = string
#}

#variable "aws_secret_key" {
#  description = "AWS secret key"
#  type        = string
#}

variable "region" {
  description = "The aws region. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html"
  type        = string
  default     = "ap-southeast-1"
}

variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
  default     = 3
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.88.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "Elsa"
    "Environment" = "Lab"
    "Owner"       = "Son.Quach"
  }
}

variable "elsa_nodes" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "k8s.io/cluster-autoscaler/enabled"     = "true"
    "k8s.io/cluster-autoscaler/elsa-nodes" = "owned"
    "k8s.io/cluster-autoscaler/elsa-lab-cluster" = "true"
    "Name"       = "elsa-nodes"
  }
}

variable "Infra_nodes" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "k8s.io/cluster-autoscaler/enabled"     = "true"
    "k8s.io/cluster-autoscaler/infra_nodes" = "owned"
    "k8s.io/cluster-autoscaler/elsa-lab-cluster" = "true"
    "Name"       = "infra_nodes"
  }
}