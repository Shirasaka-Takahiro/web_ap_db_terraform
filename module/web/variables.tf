variable "general_config" {
  type = map(any)
}
variable "ami" {}
variable "ec2_count" {}
variable "public_subnet_ids" {}
variable "internal_sg_id" {}
variable "operation_sg_1_id" {}
variable "operation_sg_2_id" {}
variable "operation_sg_3_id" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "vpc_id" {}
variable "alb_http_sg_id" {}
variable "alb_https_sg_id" {}
#variable "cert_alb_arn" {}
variable "instance_ids" {}
variable "topic_name" {}
variable "sns_email" {
  type = list(string)
}
variable "cwa_actions" {}
variable "sns_topic_arn" {}
variable "alb_name" {}
variable "alb_arn_suffix" {}
variable "tg_arn_suffix" {}