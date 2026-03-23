provider "aws" {
    region = "eu-north-1"
}

module "vpc" {
    source = "../../modules/vpc"

    vpc_cidr            = "10.0.0.0/16"
    public_subnet1_cidr = "10.0.1.0/24"
    public_subnet2_cidr = "10.0.2.0/24"
    private_subnet_cidr = "10.0.4.0/24"

    az1 = "eu-north-1a"
    az2 = "eu-north-1b"
    az3 = "eu-north-1c"
}

terraform {
    backend "s3" {
        bucket = "tf-state-shubham-2026-241030170214-eu-north-1-an"
        key = "dev/terraform.tfstate"
        region = "eu-north-1"
        dynamodb_table = "terraform-locks"
      
    }
}

module "ec2" {
    source = "../../modules/ec2"

    ami = "ami-080254318c2d8932f"
    instance_type = "t3.micro"
    subnet_id = module.vpc.public_subnet1_id
    vpc_id = module.vpc.vpc_id
  
}