resource "aws_launch_template" "frontend_lt" {
  name_prefix   = "frontend-template-"   # avoids duplicate name errors
  image_id      = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  key_name      = "myjob744-kp"

  vpc_security_group_ids = [
    aws_security_group.frontend_sg.id
  ]

  # ✅ Fixed user_data: no leading spaces, proper HEREDOC
  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
EOF

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "frontend-instance"
      Role = "frontend"
    }
  }
}
