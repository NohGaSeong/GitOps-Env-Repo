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