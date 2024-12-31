##Access key
variable "access_key" {
  description = "Access key"
  type        = string
}

##Secret Key
variable "secret_key" {
  description = "Secret Key"
  type        = string
}

##General Config
variable "general_config" {
  type = map(any)
  default = {
    project = "example"
    env     = "dev"
  }
}

##Regions
variable "regions" {
  default = {
    tokyo = "ap-northeast-1"
  }
}

##Security Group CIDR
variable "operation_sg_1_cidr" {
  default = ["0.0.0.0/0"]
}

variable "operation_sg_2_cidr" {
  default = ["0.0.0.0/0"]
}

variable "operation_sg_3_cidr" {
  default = ["0.0.0.0/0"]
}

##EC2
variable "ami" {
  description = "ID of AMI to use for ec2 instance"
  default     = "ami-0abb7b60d1c69c211"
}

variable "ec2_count" {
  description = "Number of EC2 instance"
  default     = "1"
}

variable "instance_type" {
  description = "Instance type of EC2"
  type        = string
  default     = "t3.micro"
}

variable "volume_type" {
  description = "Root block device of EC2"
  type        = string
  default     = "gp2"
}

variable "volume_size" {
  description = "Root block device size of EC2"
  default     = 100
}

variable "key_name" {
  description = "Key pair's name"
  type        = string
}

variable "public_key_path" {
  description = "Public key path. For example: ~/.ssh/terraform.pub"
  type        = string
}

