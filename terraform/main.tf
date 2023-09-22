provider "aws" {
    region = var.region
}

locals {
    additional_tags = {
        Terraform   = "true"
        environment =  var.environment
    }
}