variable "general_config" {
  type = map(any)
}
variable "ami" {}
variable "ec2_count" {}
variable "private_subnet_ids" {}
variable "internal_sg_id" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "topic_name" {}
variable "sns_email" {
  type = list(string)
}
variable "instance_ids" {}
variable "cwa_actions" {}
variable "sns_topic_arn" {}