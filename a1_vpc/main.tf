resource "aws_vpc" "vpc_1" {
  cidr_block           = var.globals.vpc_1_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.globals.vpc_1_name}-${var.globals.environment}"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.globals.vpc_1_subnet_1_block
  map_public_ip_on_launch = true
  availability_zone       = var.globals.vpc_1_subnet_1_az
  tags = {
    Name = "${var.globals.vpc_1_name}-${var.globals.vpc_1_subnet_1_name}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc_1.id
  tags = {
    Name = "${var.globals.vpc_1_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "${var.globals.vpc_1_name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


