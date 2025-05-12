resource "aws_instance" "public_ssm_instance" {
  ami           = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.pub_sub.id
   iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  associate_public_ip_address = true # for public subnet only

  tags = {
    Name = "public_ssm_instance"
  }
   user_data = <<-EOF
              #!/bin/bash
              yum update -y
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF
}


resource "aws_instance" "private_ssm_instance" {
  ami           = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.pvt_sub.id
   iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  associate_public_ip_address = false # for private subnet only

  tags = {
    Name = "private_ssm_instancee"
  }
   user_data = <<-EOF
              #!/bin/bash
              yum update -y
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF
}