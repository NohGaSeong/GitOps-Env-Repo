resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = merge(
        {
            Name = "${var.namespace}-vpc"
        },
        local.additional_tags
    )
}

resource "aws_subnet" "public_subnet" {
    for_each = { for subnet in local.public_subnets : format("public_subnet_%s", subnet.availability_zone) => subnet if length(var.public_subnet_cidrs) > 0 }

    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = each.value.availability_zone
    cidr_block              = each.value.cidr_block
    map_public_ip_on_launch = true

    tags = merge(
        {
            Name                     = format("%s-public-subnet-%s", var.namespace, split("-", each.value.availability_zone)[2])
            "kubernetes.io/role/elb" = 1
        },
    local.additional_tags
    )
}

resource "aws_subnet" "private_subnet" {
    for_each = { for subnet in local.private_subnets : format("private_subnet_%s", subnet.availability_zone) => subnet if length(var.private_subnet_cidrs) > 0 }

    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = each.value.availability_zone
    cidr_block              = each.value.cidr_block
    map_public_ip_on_launch = false

    tags = merge(
    {
        Name                              = format("%s-private-subnet-%s", var.namespace, split("-", each.value.availability_zone)[2])
        "kubernetes.io/role/internal-elb" = 1
    },
    local.additional_tags
    )
}

