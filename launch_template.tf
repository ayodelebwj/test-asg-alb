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
apt install -y python3
apt install -y nginx
systemctl start nginx
systemctl enable nginx
echo "OK" > /var/www/html/health
sudo snap install amazon-ssm-agent --classic
sudo systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

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

# install python and dependencies
apt update -y
apt install -y python3
apt install -y python3.12-venv python3-pip git

# clone repo
cd /home/ubuntu
git clone https://github.com/techbleat/class25-26-project2.git

# create virtual environment
python3 -m venv /home/ubuntu/class25-26-project2/venv

# activate venv and install requirements
source /home/ubuntu/class25-26-project2/venv/bin/activate
cd /home/ubuntu/class25-26-project2
pip install -r requirements.txt

# create systemd service
cat <<EOT | tee /etc/systemd/system/backend-app.service
[Unit]
Description=Backend FastAPI App
After=network.target

[Service]
User=ubuntu
Group=ubuntu
WorkingDirectory=/home/ubuntu/class25-26-project2
Environment="PATH=/home/ubuntu/class25-26-project2/venv/bin"
ExecStart=/home/ubuntu/class25-26-project2/venv/bin/uvicorn app.main:app --host 0.0.0.0 --port 8000
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOT

# reload systemd and start service
systemctl daemon-reload
systemctl enable backend-app
systemctl start backend-app
sudo snap install amazon-ssm-agent --classic
sudo systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
chown ubuntu:ubuntu /home/ubuntu/class25-26-project2
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

