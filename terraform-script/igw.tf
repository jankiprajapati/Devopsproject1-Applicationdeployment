#Internet Gateway for VPC-1
resource "aws_internet_gateway" "igw1"{
   vpc_id = aws_vpc.vpc1.id
   tags = merge(
    {
      Name        = "${var.name1}-igw",
    },
    var.tags
  )
}

#Route to IGW in VPC-1
resource "aws_route" "igw1"{
 route_table_id = aws_route_table.public-1.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.igw1.id
}

#Internet Gateway for VPC-2
resource "aws_internet_gateway" "igw2"{
   vpc_id = aws_vpc.vpc2.id
   tags = merge(
    {
      Name        = "${var.name2}-igw",
    },
    var.tags
  )
}

#Route to IGW in VPC-2
resource "aws_route" "igw2"{
 route_table_id = aws_route_table.public-2.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.igw2.id
}
