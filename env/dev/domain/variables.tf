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

##Regions
variable "regions" {
  default = {
    tokyo = "ap-northeast-1"
  }
}

##Route53
variable "zone_id" {
  description = "Zone id on Route53"
  type        = string
}

variable "zone_name" {
  description = "Zone name on Route53"
  type        = list(string)
}

##ACM
variable "domain_name" {
  description = "Domain name for ACM"
  type        = string
}

variable "sans" {
  description = "Subject alternative names for ACM"
  type        = string
}