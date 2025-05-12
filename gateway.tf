resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "igw"
    }
}
resource "aws_eip" "eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "gw_NAT" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pub_sub.id

  tags = {
    Name = "gw_NAT"
  }
}

