data "aws_instances" "backend_asg_instances" {
  filter {
    name   = "tag:Role"
    values = ["backend"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}