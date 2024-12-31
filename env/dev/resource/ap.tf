##EC2
module "ap" {
  source = "../../../module/ap"

  ##EC2
  general_config     = var.general_config
  ec2_count          = var.ec2_count
  ami                = var.ami
  private_subnet_ids = data.terraform_remote_state.private_subnet_ids.outputs.private_subnet_ids
  internal_sg_id     = data.terraform_remote_state.internal_sg_id.outputs.internal_sg_id
  key_name           = data.terraform_remote_state.key_pair_name.outputs.key_pair_name
  instance_type      = var.instance_type
  volume_type        = var.volume_type
  volume_size        = var.volume_size
}