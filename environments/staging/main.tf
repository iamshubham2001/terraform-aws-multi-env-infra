provider "aws" {
    region = "eu-north-1"
}

module "vpc" {
    source = "../../modules/vpc"

    vpc_cidr            = "10.1.0.0/16"
    public_subnet1_cidr = "10.1.1.0/24"
    public_subnet2_cidr = "10.1.2.0/24"
    private_subnet_cidr = "10.1.4.0/24"

    az1 = "us-east-1a"
    az2 = "us-east-1b"
    az3 = "us-east-1c"
}