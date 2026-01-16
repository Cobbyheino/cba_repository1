variable "region" {
  default = "eu-west-3"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "instance_ami" {
  default = "ami-0f95dedaf2f938d49"
}


variable "vpc_id" {
  default = ""
}


variable "key_name" {
  default = "terraform"
}