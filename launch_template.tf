resource "aws_launch_template" "frontend_lt" {
  name_prefix   = "frontend-template-"
  image_id      = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  key_name      = "myjob744-kp"

  vpc_security_group_ids = [
    aws_security_group.frontend_ec2_sg.id
  ]
  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install -y nginx
systemctl start nginx
systemctl enable nginx
echo "OK" > /var/www/html/health
EOF
  )
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "frontend-instance"
      Role = "frontend"
    }
  }
}
