output "this_sg" {
  description = "Security Group ID"
  value = aws_security_group.testSG.id
}

output "this_pub_subnet" {
  description = "Public Subnet"
  value = aws_subnet.pub_subnet.id
}
output "public_instnace" {
  value = ["${aws_instance.pub-ec2.id}", "${aws_instance.pub-ec2.private_ip}", "${aws_instance.pub-ec2.public_ip}"]
}
output "private_instance" {
  value = ["${aws_instance.private-ec2.id}", "${aws_instance.private-ec2.private_ip}"]
}


