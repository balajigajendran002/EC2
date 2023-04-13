output "ec2_instance_id" {
    value = aws_instance.this.id
  }

output "Ec2_instance_privateIP" {
    value = aws_instance.this.private_ip
  }

output "SG_ID" {
    value = aws_security_group.SG.id
  }