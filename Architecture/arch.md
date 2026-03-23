

                       Terraform
                          │
    ┌─────────────────────┼─────────────────────┐
    │                     │                     │
modules/vpc           modules/ec2          environments
    │                     │                     │
    ▼                     ▼                     │──────────┐──────────┐
 AWS VPC             EC2 Instance               │          │          │
    │                   │                       ▼          ▼          ▼
    ├── Public Subnets  └── Security Group     dev      staging      prod
    ├── Private Subnet                         │          │          │
    ├── Internet Gateway                       ├─ main.tf ├─ main.tf ├─ main.tf
    └── Route Table                            ├─ vars.tf ├─ vars.tf ├─ vars.tf
                                               └─ out.tf  └─ out.tf  └─ out.tf


                Remote Terraform State
                       │
            ┌──────────┴──────────┐
            │                     │
        AWS S3 Bucket       DynamoDB Table
      (terraform.tfstate)   (State Locking) 