provider "aws" {
    region = var.region
}

data "aws_availability_zones" "available" {
    state = "available"
}

locals {
    additional_tags = {
        Terraform   = "true"
        environment =  var.environment
    }

    availability_zones = slice(data.aws_availability_zones.available.names, 0, length(var.public_subnet_cidrs))

    public_subnets = [
        for index, cidr in var.public_subnet_cidrs : {
            cidr_block        = cidr
            availability_zone = local.availability_zones[index]
        }
    ]

    private_subnets = [
        for index, cidr in var.private_subnet_cidrs : {
            cidr_block        = cidr
            availability_zone = local.availability_zones[index]
        }
    ]
}
