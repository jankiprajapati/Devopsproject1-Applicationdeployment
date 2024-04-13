#vpc-1
resource "aws_vpc" "vpc1"{
 tags = merge (
      {
          Name = var.name1
      },
      var.tags
  )
 cidr_block               = var.vpc_1_cidr_block
}

#vpc-2
resource "aws_vpc" "vpc2"{
 tags = merge (
      {
          Name = var.name2
      },
      var.tags
  )
 cidr_block               = var.vpc_2_cidr_block
}

#public-subnet of VPC1
resource "aws_subnet" "public-1" {
  count                   = length(var.public_1_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.public_1_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = merge (
      {
          Name = "${var.name1}-public-subnet-${count.index}"
      },
      var.tags
  )
}

#public-subnet of VPC2
resource "aws_subnet" "public-2" {
  count                   = length(var.public_2_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.vpc2.id
  cidr_block              = var.public_2_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = merge (
      {
          Name = "${var.name2}-public-subnet-${count.index}"
      },
      var.tags
  )
}

#Route table associasion for public-subnet in vpc1
resource "aws_route_table_association" "public-1" {
  count          = length(aws_subnet.public-1)
  subnet_id      = aws_subnet.public-1[count.index].id
  route_table_id = aws_route_table.public-1.id
}

#Route table associasion for public-subnet in vpc2
resource "aws_route_table_association" "public-2" {
  count          = length(aws_subnet.public-2)
  subnet_id      = aws_subnet.public-2[count.index].id
  route_table_id = aws_route_table.public-2.id
}
