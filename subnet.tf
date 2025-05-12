resource "aws_subnet" "pub_sub" {
    vpc_id = aws_vpc.vpc.id
    cidr_block       = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.igw]
    tags = {
      Name = "pub_sub"
    }

}
resource "aws_subnet" "pvt_sub" {
    vpc_id = aws_vpc.vpc.id
    cidr_block       = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "pvt_sub"
    }
}
