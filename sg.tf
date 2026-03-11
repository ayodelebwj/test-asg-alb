resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
<<<<<<< HEAD
  description = "Allow HTTP and HTTPS to ALB"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "HTTP from internet"
=======
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = data.aws_vpc.existing_vpc.id

  ingress {
    description = "Allow HTTP"
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
<<<<<<< HEAD
    description = "HTTPS from internet"
=======
    description = "Allow HTTPS"
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
<<<<<<< HEAD
    description = "Allow outbound traffic"
=======
    description = "Allow all outbound traffic"
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
<<<<<<< HEAD
}

resource "aws_security_group" "frontend_ec2_sg" {
  name        = "frontend-ec2-sg"
  description = "Allow traffic from ALB to frontend EC2"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description     = "Allow HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
=======

  tags = {
    Name = "alb-security-group"
  }
}

resource "aws_security_group" "frontend_sg" {
  name        = "frontend-security-group"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = data.aws_vpc.existing_vpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
<<<<<<< HEAD
    description = "Allow SSH from admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
=======
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Allow all outbound traffic"
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
<<<<<<< HEAD
}
=======

  tags = {
    Name = "frontend-security-group"
  }
}

>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
