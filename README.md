# terraform
![alt](vpc-private-public-Infra.png)

## about automation
this automation is focused on creating below aws resources
1. vpc from scratch
2. public and private subnet
3. public and private route table
4. internet gateway and association with public route table
5. create eip, nat gateway and association with private route table
6. create ec2 machine each in both subnet
7. install jenkins and ansible on public_subnet machine.

all files are under terraform/terraform-vpc

Note: assign aws ec2_role to the bastion/jump ec2 machine instead of aws configure, avoid to configure aws credential and use IAM Role

AWS IAM Role for bastion/jump ec2 instance.

- Create role (ec2-role)
- Role description : Allows EC2 instances to call AWS services on your behalf
- Attach Policy: AdministratorAccess
