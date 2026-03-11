resource "aws_instance" "frontend_az_1" {
  ami           = "ami-0b6c6ebed2801a5cb"  # Replace with the correct AMI ID for your region
  instance_type = "t2.micro"
  key_name      = "office-kp"            # Optional: for SSH access
  subnet_id     = "subnet-0eed1227f375c1d08"

  vpc_security_group_ids = [
    aws_security_group.frontend_ec2_sg.id
  ]

  tags = {
    Name = "frontend-ec1"
  }
}

resource "aws_instance" "frontend_az_2" {
  ami           = "ami-0b6c6ebed2801a5cb"  # Replace with the correct AMI ID for your region
  instance_type = "t2.micro"
  key_name      = "office-kp"            # Optional: for SSH access
  subnet_id     = "subnet-0e7c30f99b3fd1f62"

  vpc_security_group_ids = [
    aws_security_group.frontend_ec2_sg.id
  ]

  tags = {
    Name = "frontend-ec2"
  }
}
