## AWS VPC with Public & Private Subnets and SSM-Enabled EC2 Instances
### This Terraform project:

✅ Provisioned an AWS VPC with a CIDR block of 10.0.0.0/16

✅ Created two subnets:

Public Subnet: 10.0.0.0/24 in Availability Zone us-east-1a

Private Subnet: 10.0.1.0/24 in Availability Zone us-east-1b

✅ Deployed two EC2 instances:

One in the public subnet with internet access

One in the private subnet using a NAT Gateway for outbound access

✅ Enabled EC2 System Manager (SSM) access by:

Creating an IAM Role and Instance Profile

Attaching the AmazonSSMManagedInstanceCore policy

✅ Set up networking components:

Internet Gateway for public access

Elastic IP and NAT Gateway for private subnet internet access

Route Tables for both subnets

✅ Configured User Data to:

### Update packages

Start and enable the SSM agent on both instances
How to Use
Make sure your AWS CLI is configured.

#### Initialize Terraform:
terraform init

#### Preview the changes:
terraform plan

#### Apply the changes:
terraform apply

