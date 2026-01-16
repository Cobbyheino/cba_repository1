provider "aws" {
 region = var.region
}

resource "aws_security_group" "cba_tef_sg" {
 name        = "cba_tef_sg"
 description = "allow all traffic"
 ingress {
   from_port  = 22
   to_port    = 22
   protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
   from_port  = 80
   to_port    = 80
   protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
   from_port  = 0
   to_port    = 0
   protocol   = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
   name = "CBAterraeformSG"
 }
}

resource "aws_instance" "cba_tf_instance" {
  instance_type = var.instance_type
  security_groups = [aws_security_group.cba_tef_sg.name]
  ami = var.instance_ami
  key_name = var.key_name
  user_data = file("install_apache.sh")

  tags = {
    Name = "CBATerraformInstance"
    }
}