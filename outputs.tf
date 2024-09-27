output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "ebs_volume_id" {
  value = aws_ebs_volume.additional_volume.id
}

output "aws_security_group" {
  value = aws_security_group.ssh_access.name
}