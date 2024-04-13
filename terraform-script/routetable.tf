#Public Route Table of VPC1
resource "aws_route_table" "public-1" {
  vpc_id = aws_vpc.vpc1.id

  tags = merge(
    {
      Name        = "${var.name1}-public-route-table",
    },
    var.tags
  )
}

#Public Route Table of VPC2
resource "aws_route_table" "public-2" {
  vpc_id = aws_vpc.vpc2.id

  tags = merge(
    {
      Name        = "${var.name2}-public-route-table",
    },
    var.tags
  )
}
