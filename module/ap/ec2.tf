##AP Instance
resource "aws_instance" "ap" {
  ami       = var.ami
  count     = var.ec2_count
  subnet_id = element(var.private_subnet_ids, count.index % 2)
  vpc_security_group_ids = [
    var.internal_sg_id
  ]
  key_name      = aws_key_pair.key.id
  instance_type = var.instance_type
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${format("ap%02d", count.index + 1)}"
  }
}

##Key Pair
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}