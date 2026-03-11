# Lookup existing VPC by Name tag
data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["myvpc"]  
  }
}