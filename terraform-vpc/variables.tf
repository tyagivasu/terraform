variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR VPC"
  default = "172.16.0.0/16"
}

variable "pub_subnet_cidr" {
  description = "CIDR PUBLIC SUBNET"
  default = "172.16.10.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR PRIVATE SUBNET"
  default = "172.16.20.0/24"
}

variable "ami" {
  default = "ami-07d0cf3af28718ef8"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "wickedvik0"
}
