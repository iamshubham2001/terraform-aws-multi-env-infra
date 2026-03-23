variable "ami" {
    type = string
    default = "ami-080254318c2d8932f"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "subnet_id"{}
variable "vpc_id"{}
