resource "aws_instance" "pub-ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = "${aws_subnet.pub_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.testSG.id}"]
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install.sh")}"
  tags = {
    Name = "Public TestEC2"
  }
}

resource "aws_instance" "private-ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = "${aws_subnet.private_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.testSG.id}"]
  associate_public_ip_address = false
  tags = {
    Name = "Private TestEC2"
  }
}

