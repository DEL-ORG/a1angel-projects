variable "region" {
  type        = string
  description = "your desire aws region"
  default     = "us-east-1"
}

variable "ami_type" {
  type    = string
  default = "a1angel_ubuntu"
}


locals {
  instance_ami = var.ami_type == "a1angel_redhat" ? data.aws_ami.a1angel_redhat.id : var.ami_type == "a1angel_ubuntu" ? data.aws_ami.a1angel_ubuntu.id : var.ami_type == "a1angel_amzon_linux" ? data.aws_ami.a1angel_amzon_linux.id : var.ami_type == "a1angel_windows" ? data.aws_ami.a1angel_windows.id : "ami-0970e830e6f900dad"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1800"
    "owner"          = "a1angel"
    "teams"          = "devops"
    "environment"    = "dev"
    "project"        = "ec2"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "a1angel_ports" {
  type = list(number)
  default = [
    22,
    80,
    8080
  ]
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "tenancy" {
  type    = string
  default = "default"
}
variable "pub_ip" {
  type    = bool
  default = true
}
variable "api_termination" {
  type    = bool
  default = true
}
variable "volume_size" {
  type    = number
  default = 8
}

variable "subnet_id" {
  type    = list(string)
  default = ["subnet-02b56024f2820201d"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-04081456ed925b05c"
}

variable "key" {
  type    = string
  default = "utc-key"
}

variable "backend" {
  type = map(string)
  default = {
    bucket         = ""
    dynamodb_table = ""
    key            = ""
    region         = ""
  }
}




