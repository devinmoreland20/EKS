resource "aws_vpc" "project" {
  cidr_block       = var.vpc_cidr #our cidr is now a variable. 
  instance_tenancy = "default"
  tags = {
    Name = "Project"
  }
}

resource "aws_internet_gateway" "project_gw" {
  vpc_id = aws_vpc.project.id

  tags = {
    Name = "Project"
  }
}
data "aws_availability_zones" "available" {
}


resource "random_shuffle" "az_list" {
  input        = data.aws_availability_zones.available.names
  result_count = 2
}

resource "aws_subnet" "public_project_subnet" {
  count                   = var.public_sn_count
  vpc_id                  = aws_vpc.project.id
  cidr_block              = var.public_cidrs[count.index]
  availability_zone       = random_shuffle.az_list.result[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "project public ${count.index}"
  }
}


resource "aws_default_route_table" "internal_project_default" {
  default_route_table_id = aws_vpc.project.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_gw.id
  }
  tags = {
    Name = "Project-internal-RT"
  }
}

resource "aws_route_table_association" "default" {
  count          = var.public_sn_count
  subnet_id      = aws_subnet.public_project_subnet[count.index].id
  route_table_id = aws_default_route_table.internal_project_default.id
}

