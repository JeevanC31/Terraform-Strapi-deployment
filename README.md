#  AWS EC2 + ALB + Strapi using Terraform

This project provisions a **production-ready AWS infrastructure** using **Terraform** to deploy a **Strapi application** running inside **Docker on an EC2 instance**, fronted by an **Application Load Balancer (ALB)**.

The setup follows **Infrastructure as Code (IaC)** best practices using **modular Terraform design**.

---

##  Architecture Overview

- Custom VPC with public subnets  
- Security Groups for EC2 and ALB  
- EC2 instance with Docker installed via `user_data`  
- Strapi application running in a Docker container  
- Application Load Balancer (ALB)  
- Target Group attached to EC2 instance  
- Modular Terraform structure  



Client
|
v
Application Load Balancer (ALB)
|
v
Target Group
|
v
EC2 Instance (Docker + Strapi)


---

##  Project Structure

```text
.
├── modules/
│   ├── alb/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── vpc/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── userdata.sh
├── .gitignore
└── README.md



---

##  Prerequisites

- AWS account
- IAM user with required permissions
- AWS CLI configured
- Terraform installed (v1.3+ recommended)
- SSH key pair (or generated via Terraform)