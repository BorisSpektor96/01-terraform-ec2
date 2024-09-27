resource "aws_instance" "ec2_instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "01EC2"

  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  root_block_device {
    volume_size = var.root_volume_size
  }

   user_data = <<-EOF
              #!/bin/bash
              mkfs -t ext4 /dev/xvdf      
              mkdir /mnt/ebs
              mount /dev/xvdf /mnt/ebs
    EOF

  tags = {
    Name = "Terraform-EC2"
  }
}

resource "aws_security_group" "ssh_access" {
  name = "ssh-access"
  description = "allow SSH access on port 22"

# Inbound rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this to your specific IP for better security
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_ebs_volume" "additional_volume" {
  availability_zone = aws_instance.ec2_instance.availability_zone
  size = var.ebs_volume_size
  type = var.ebs_volume_type
  tags = {
    Name = "Terraform-EBS"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdb"
  volume_id = aws_ebs_volume.additional_volume.id
  instance_id = aws_instance.ec2_instance.id
}