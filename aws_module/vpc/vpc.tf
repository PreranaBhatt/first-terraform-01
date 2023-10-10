resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "customized vpc"
  }
}

resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internetgateway"
  }
}

resource "aws_subnet" "subnet" {
  
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.0.0/24"
  tags = {
    Name = "subnet"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Igw.id
  }
}

resource "aws_route_table_association" "rta" {
    subnet_id      = aws_subnet.subnet.id
     route_table_id = aws_route_table.route_table.id
}


output "output_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "output_vpc_subnet_id" {
  value = "${aws_subnet.subnet.id}"
}