variable "region" {
    description = "Region Of VPC"
    type = string 
    default = "ap-south-1"  
}

variable "name1" {
    description = "Name of the VPC"
    type = string    
    default = "Proj1-VPC1"
}

variable "vpc_1_cidr_block" {
    description = "CIDR Range Of VPC"
    type = string  
    default = "11.0.0.0/16"
}

variable "name2" {
    description = "Name of the VPC"
    type = string    
    default = "Proj1-VPC2"
}

variable "vpc_2_cidr_block" {
    description = "CIDR Range Of VPC"
    type = string  
    default = "12.0.0.0/16"
}

variable "public_1_subnet_cidr_blocks" {
    description = "Region Of VPC"
    type = list(string)  
    default = ["11.0.1.0/24"]  
}

variable "availability_zones" {
    description = "Region Of VPC"
    type = list(string)
    default = ["ap-south-1a"]
}

variable "public_2_subnet_cidr_blocks" {
    description = "Region Of VPC"
    type = list(string)  
    default = ["12.0.1.0/24"]  
}

variable "insttype" {
    description   = "Instance Type"
    type          = string
    default       = "t2.micro"  
}

variable "ami" {
    description   = "AMI ID of Amazon-Linux in us-east-1"
    type          = string
    default       = "ami-03bb6d83c60fc5f7c"  
}

variable "tags" {
    description = "Region Of VPC"
    type = map
    default = null
}
