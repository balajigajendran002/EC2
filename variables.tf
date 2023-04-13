variable "ami_id" {
    type = string
    description = "ami for demo server"
  }

variable "instance_type" {
    type = string
    description = "instance type"
  }

variable "availability_zone" {
    type = string
    description = "Instance AZ"
  }

variable "tags" {
   type = map(string)
   description = "tags"
    }


variable "sg_name" {
    type = string
    description = "sg_name"
  }

variable "sg_description" {
    type = string
    description = "all http"
  }

variable "sg_inbound_rules" {
    type = list(object ({
        from_port = number
        to_port = number
        description = string
        protocol = string
        cidrblocks = list(string)
    }))
  description = "SG for inbount rules"
}

variable "sg_tags" {
    type = map(string)
    description = "sg_tags"
  }