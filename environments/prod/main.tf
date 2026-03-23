provider "aws" {
    region = "eu-north-1"
}

module "vpc" {
    source = "../../modules/vpc"

    vpc_cidr = "10.2.0.0/16"
    public_subnet1_cidr = "10.2.1.0/24"
    public_subnet2_cidr = "10.2.2.0/24"
    private_subnet_cidr = "10.2.4.0/24"

    az1 = "eu-north-1a"
    az2 = "eu-north-1b"
    az3 = "eu-north-1c"

}