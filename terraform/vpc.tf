resource "aws_vpc" "test-vpc" {
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