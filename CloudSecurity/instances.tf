resource "aws_instance" "nebo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-nebo.id]
  monitoring             = true
  iam_instance_profile   = "Ec2SSM"

  user_data = <<-EOL
    #!/bin/bash -xe
    sudo amazon-linux-extras enable epel
    sudo yum install epel-release -y
    sudo yum install nginx -y
    sudo systemctl start nginx.service
  EOL

  tags = {
    "Name" : "nebo"
  }
}