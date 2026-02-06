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

## 📁 Project Structure

```text
.
├── .terraform/
├── .gitignore
├── .terraform.lock.hcl
├── alb.tf
├── ec2.tf
├── igw.tf
├── keypair.tf
├── nat.tf
├── outputs.tf
├── provider.tf
├── README.md
├── route_tables.tf
├── security_groups.tf
├── subnet.tf
├── user_data.sh
├── variables.tf
└── vpc.tf




---

##  Prerequisites

- AWS account
- IAM user with required permissions
- AWS CLI configured
- Terraform installed (v1.3+ recommended)
- SSH key pair (or generated via Terraform)

Terraform Configuration Overview
VPC (vpc.tf)

Creates a custom VPC with CIDR block

Subnets (subnet.tf)

Public subnet for ALB and NAT Gateway

Private subnet for EC2 instance

Internet Gateway (igw.tf)

Enables internet access for public subnet

NAT Gateway (nat.tf)

Allows private EC2 instance outbound internet access

Route Tables (route_tables.tf)

Public route table → Internet Gateway

Private route table → NAT Gateway

Security Groups (security_groups.tf)

ALB security group (HTTP access)

EC2 security group (restricted inbound traffic)

EC2 Instance (ec2.tf)

EC2 launched in private subnet

Uses user_data.sh for bootstrapping

Load Balancer (alb.tf)

Application Load Balancer

Listener and target group

Forwards traffic to EC2

Key Pair (keypair.tf)

Manages SSH key pair via Terraform