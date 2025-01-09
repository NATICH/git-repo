provider "aws" {

  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-02dcfe5d1d39baa4e"
  instance_type = var.instance_type
  subnet_id = "subnet-02dd7837c00b86110"
  tags = {
    Name = var.server_name
  }
}
 variable "instance_type" {
  default = "t2.micro"

 }
terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "my-bucket-name"
    key = "path/to/state/file"
  }
}
variable "server_name" {
  type = string
  default = "my-server"
  description = "the name of the server"
}

output "ip_address" {
  value = aws_instance.web.private_ip
}

