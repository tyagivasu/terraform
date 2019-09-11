# VPC
resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "testVPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name = "testVPCIGW"
  }
}

resource "aws_route_table" "testR" {
  vpc_id = aws_vpc.test.id
  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "PUBLIC Subnet RT"
  }

}

resource "aws_route_table" "testPrivateRT" {
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "PRIVATE Subnet RT"
  }

}


resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.test.id
  cidr_block = var.pub_subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "testPUBLIC Subnet" 
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.test.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "testPRIVATE Subnet"
  }
}

resource "aws_route_table_association" "pub-rt" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.testR.id
}

resource "aws_route_table_association" "private-rt" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.testPrivateRT.id
}

resource "aws_eip" "natip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.natip.id
  subnet_id = aws_subnet.pub_subnet.id
  tags = {
    Name = "gw NAT"
  }
}

resource "aws_security_group" "testSG" {
  name = "testSG"
  description = "SG for Test VPC"
  vpc_id = aws_vpc.test.id
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  tags = {
    Name = "testVPC SG"
  }
}
