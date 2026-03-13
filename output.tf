output "backend_private_ips" {
  value = data.aws_instances.backend_asg_instances.private_ips
}

output "backend_instance_ids" {
  value = data.aws_instances.backend_asg_instances.ids
}