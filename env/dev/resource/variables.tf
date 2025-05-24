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

##EC2
variable "ami" {
  description = "ID of AMI to use for ec2 instance"
  default     = "ami-0abb7b60d1c69c211"
}

variable "ec2_count" {
  description = "Number of EC2 instance"
  default     = "2"
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

##RDS Option Group
variable "engine_name" {
  type    = string
  default = "mysql"
}

variable "major_engine_version" {
  type    = string
  default = "8.0"
}

##RDS Instance
variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "username" {
  description = "root username of db instance"
  type        = string
}

variable "password" {
  description = "root password of db instance"
  type        = string
}

variable "instance_class" {
  description = "The class of db instance"
  type        = string
  default     = "db.t3.medium"
}

variable "storage_type" {
  description = "The storage type of db instance"
  type        = string
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The allocated storage of db instance"
  default     = 20
}

variable "multi_az" {
  description = "multi az of db instance"
  type        = string
  default     = "false"
}

##SNS
variable "topic_name" {
  description = "email address for sns"
  type        = string
}

variable "sns_email" {
  description = "email address for sns"
  type        = list(string)
}

##CloudWatch
variable "cwa_actions" {
  description = "CloudWatch alearm actions"
  type        = string
  default     = "false"
}