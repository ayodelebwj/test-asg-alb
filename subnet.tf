data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet"]
  }
}

data "aws_subnet" "public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["pub-subnet-2"]
  }
}