resource "aws_security_group" "allow_outbound_https" {
  name        = "allow-outbound-https"
  description = "Allow outbound HTTPS traffic"
  vpc_id      = aws_vpc.vpc.id

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-https-out"
  }
}