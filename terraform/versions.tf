terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">=5.16"
        }
    }   
    required_version = ">= 0.13"
}