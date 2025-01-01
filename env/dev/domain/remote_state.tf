data "terraform_remote_state" "alb_dns_name" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-resources.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb_zone_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-resources.tfstate"
    region = "ap-northeast-1"
  }
}
