variable "region" {
    default     = "ap-northeast-2"
    type        = string
    description = "AWS Region"
}

variable "namespace" {
    default     = "test-eks" 
    type        = string
    description = "Project namespace"
}

variable "environment" {
    default     = "dev"
    type        = string
    description = "deployment evironment"
}

variable "purpose" {
    type        = string
    description = "purpose of the resource"
}

variable "owner" {
    type        = string 
    description = "owner name"
}