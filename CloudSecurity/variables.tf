# instance variables
variable "ami_id" {
  description = "ami of the instance to be created"
  type        = string
}

variable "instance_type" {
  description = "instance type of the instance to be created"
  type        = string
}

variable "key_name" {
  description = "key name to ssh into the instnace to be created"
  type        = string
}

# security group variables
variable "sg_ingress_rules" {
  description = "Security group ingress rules"
  type        = list(any)
}

variable "sg_egress_rules" {
  description = "Security group egress rules"
  type        = list(any)
}