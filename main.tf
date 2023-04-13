resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    vpc_security_group_ids = [aws_security_group.SG.id]
  }

resource "aws_security_group" "SG" {
  name        = var.sg_name
  description = var.sg_description
#  vpc_id      = aws_vpc.main.id

   dynamic "ingress" {
    for_each = var.sg_inbound_rules
     content {
       from_port = ingress.value.from_port
       to_port = ingress.value.to_port
       description = ingress.value.description
       protocol = ingress.value.protocol
       cidr_blocks = ingress.value.cidrblocks
     }
   }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}