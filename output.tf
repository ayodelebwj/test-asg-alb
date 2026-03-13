output "backend_private_ips" {
  value = aws_autoscaling_group.backend_asg.instances[*].private_ip
}

output "backend_instance_ids" {
  value = aws_autoscaling_group.backend_asg.instances[*].id
}