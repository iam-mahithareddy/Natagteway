resource "aws_route_table" "public_rtp" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public_rtp"
    }
}
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.public_rtp.id
}
resource "aws_route_table" "private_rtp" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw_NAT.id
  }

  tags = {
    Name = "private-rtb"
  }
}
resource "aws_route_table_association" "private_rt_assoc" {
  subnet_id      = aws_subnet.pvt_sub.id
  route_table_id = aws_route_table.private_rtp.id
}