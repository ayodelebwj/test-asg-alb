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
# install python and dependencies
sudo apt update -y
sudo apt install -y python3.12-venv python3-pip git
git clone https://github.com/techbleat/class25-26-project2.git
# create virtual environment
cd /home/ubuntu
python3 -m venv class25-26-project2/venv

# activate venv and install requirements
source class25-26-project2/venv/bin/activate
cd class25-26-project2
pip install -r requirements.txt

# create systemd service
cat <<EOF | sudo tee /etc/systemd/system/backend-app.service
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

# reload systemd and start service
sudo systemctl daemon-reload
sudo systemctl enable backend-app
sudo systemctl start backend-app
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

