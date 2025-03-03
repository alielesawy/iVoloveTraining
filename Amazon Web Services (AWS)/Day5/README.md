# AWS Setup

This document outlines the basic steps for setting up a simple AWS environment.

1. **Create a VPC**  
   - Start by creating a custom Virtual Private Cloud.

2. **Create Two Subnets**  
   - Create two subnets (e.g., one public and one private).

3. **Create an Internet Gateway**  
   - Attach it to the VPC so resources can reach the internet.

4. **Create a Route Table**  
   - Update it to direct traffic from the public subnet to the internet gateway.

5. **Create a Security Group (SG)**  
   - Set inbound and outbound rules to allow essential traffic (e.g., HTTP, SSH).

6. **Launch Two EC2 Instances**  
   - One runs Apache.  
   - The other runs Nginx.

7. **Create a Target Group**  
   - Register both EC2 instances to receive traffic.

8. **Create an Application Load Balancer (ALB)**  
   - Attach the target group.  
   - Distribute traffic to connected EC2 instances.

## Demo 
![aws](/src/aws-lb.gif)

- Load Balancer 
![aws](/src/aws-lb1.png)

- Target Group
![aws](/src/aws-lb2.png)
