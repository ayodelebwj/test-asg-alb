<<<<<<< HEAD
# Lookup existing VPC by Name tag
data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["myvpc"]  
=======
data "aws_vpc" "existing_vpc" {
  filter {
    name   = "tag:Name"
    values = ["myvpc"]
>>>>>>> 1186477230439599db5a04b908d1006f30f44f81
  }
}