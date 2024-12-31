data "terraform_remote_state" "vpc_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "public_subnet_ids" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "private_subnet_ids" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "internal_sg_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "operation_sg_1_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "operation_sg_2_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "operation_sg_3_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb_http_sg_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb_https_sg_id" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "key_pair_name" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-common.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "cert_alb_arn" {
  backend = "s3"

  config = {
    bucket = "web-ap-db-tfstate-bucket"
    key    = "web-ap-db-domain.tfstate"
    region = "ap-northeast-1"
  }
}