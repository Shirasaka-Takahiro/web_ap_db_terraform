##Key Pair
resource "aws_key_pair" "default" {
  key_name   = "${var.general_config["project"]}-${var.general_config["env"]}-${var.key_name}"
  public_key = file(var.public_key_path)
}