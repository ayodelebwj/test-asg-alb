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


resource "aws_launch_template" "backend_lt" {
  name_prefix   = "backend-template-"
  image_id      = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  key_name      = "myjob744-kp"

  vpc_security_group_ids = [
aws_security_group.backend_ec2_sg.id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash
sudo apt update -y
sudo apt install python3.12-venv -y
python3 -m venv venv
source venv/bin/activate
cd class25-26-project2
pip install -r requirements.txt
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload &
EOF
  )
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "backend-instance"
      Role = "backend"
    }
  }
}

