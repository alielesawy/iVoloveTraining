# Multi-Tier Application Deployment with Terraform

## Overview
This project demonstrates deploying a multi-tier application infrastructure on AWS using Terraform. The infrastructure includes a VPC, public/private subnets, EC2 instances, and necessary networking components.
## Daigram
![d](/src/d-terraform.png)
## Infrastructure Components
- VPC with CIDR block
- Public and Private Subnets
- Internet Gateway
- Route Tables
- EC2 Instances
- Security Groups
- NAT Gateway
- RDS MySQL Database

## Prerequisites
- AWS Account
- Terraform installed
- AWS CLI configured

## Steps Taken

1. **Create VPC via Console**
   - Manually created a VPC using the AWS Management Console.

2. **Import VPC into Terraform**
   - Imported the manually created VPC into Terraform to manage it programmatically.
       * ```terraform import aws_vpc.manual_vpc vpc-xxxxxxxx```
       * Then Define vpc at root module [```vpc.tf```](/Terraform/Lab1/vpc.tf)  
3. **Create Public Subnet for Web Server**
   - Defined a public subnet within the VPC for hosting the web server. [```subnet.tf```](/Terraform/Lab1/subnet.tf)

4. **Create Private Subnets**
   - Created two private subnets for internal resources, ensuring high availability across multiple availability zones. [```subnet.tf```](/Terraform/Lab1/subnet.tf)


5. **Create NAT Gateway**
   - Set up a NAT Gateway to allow instances in the private subnets to access the internet while remaining inaccessible from the public internet. [```nat.tf```](/Terraform/Lab1/nat.tf)


6. **Create Internet Gateway**
   - Attached an Internet Gateway to the VPC to enable internet access for resources in the public subnet. [```internet-gateway.tf```](/Terraform/Lab1/internet-gateway.tf)


7. **Create Route Tables**
   - Configured route tables to manage traffic routing within the VPC, including routes for the Internet Gateway and NAT Gateway.  [```route-table.tf```](/Terraform/Lab1/route-table.tf)


8. **Associate Subnets with Route Tables**
   - Associated the public and private subnets with their respective route tables to ensure proper routing of traffic. [```route-table.tf```](/Terraform/Lab1/route-table.tf)


9. **Create MySQL Database**
   - Provisioned an RDS MySQL database instance within the private subnets for secure data storage. [```RDS.tf```](/Terraform/Lab1/rds.tf)


10. **Create EC2 Web Server**
    - Launched an EC2 instance in the public subnet to serve as the web server. [```ec2.tf```](/Terraform/Lab1/ec2.tf)


11. **Create Security Group for Web Server**
    - Defined a security group to control inbound and outbound traffic for the web server, allowing HTTP and SSH access. [```secuirty-group.tf```](/Terraform/Lab1/secuirty-group.tf)


12. **Create Security Group for RDS**
    - Created a security group for the RDS instance to restrict access to only the necessary ports and IP ranges. [```database-sg.tf```](/Terraform/Lab1/database-sg.tf)


13. **Local Provisioner**
    - Used Terraform's local provisioner to write the IP address of the EC2 instance to a file named `ec2-ip.txt`.
14. **Reviwe Plan file**    
    - [Plan](/Terraform/Lab1/paln.txt)
## Demo
- Apply
![a](/src/apply1.png)
![a](/src/apply2.png)

- VPC
![v](/src/vpc.png)

- EC2
![v](/src/web.png)

- MySQL DB
![s](/src/db.png)
