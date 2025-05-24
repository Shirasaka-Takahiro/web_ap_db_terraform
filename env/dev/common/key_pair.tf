##Key Pair
module "key_pair" {
  source = "../../../module/common/key_pair"

  general_config  = var.general_config
  key_name        = var.key_name
  public_key_path = var.public_key_path
}