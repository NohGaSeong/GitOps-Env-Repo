variable "region" {
    default     = "ap-northeast-2"
    type        = string
    description = "AWS Region"
}

variable "namespace" {
    default     = "test" 
    type        = string
    description = "Project namespace"
}

variable "environment" {
    default     = "dev"
    type        = string
    description = "deployment evironment"
}

variable "vpc_cidr" {
    type        = string
    description = "vpc cidr"
}

variable "public_subnet_cidrs" {
    type = list(string)
    description = "IPv4 CIDR blocks(public)"
}

variable "private_subnet_cidrs" {
    type = list(string)
    description = "IPv4 CIDR blocks(private)"
}

variable "enable_nat_gateway" {
    default = true
    type    = bool
}

variable "single_nat_gateway" {
    default = false
    type    = bool
}

variable "ssh_port" {
    default = 22
    type    = number 
}

variable "cluster_version" {
    default = null
    type    = string
}