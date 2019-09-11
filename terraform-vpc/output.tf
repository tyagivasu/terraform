output "this_sg" {
  description = "Security Group ID"
  value = aws_security_group.testSG.id
}

output "this_pub_subnet" {
  description = "Public Subnet"
  value = aws_subnet.pub_subnet.id
}
