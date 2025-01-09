provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  subnet_id = "subnet-018523f5b12a8b3fb"
  tags = {
    Name = var.server_name
  }
}

#terraform {
#  backend "s3" {
#    region = "eu-central-1"
#    bucket = "my-bucket-name"
#    key = "path/to/state/file"
#  }
#}
variable "server_name" {
  type = string
  default = "my-server"
  description = "the name of the server"
}

output "ip_address" {
  value = aws_instance.web.private_ip
}