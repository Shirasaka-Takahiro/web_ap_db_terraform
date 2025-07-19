##Security Group
resource "aws_security_group" "default" {
  name   = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg01"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-${var.sg_role}-sg01"
  }

}

##Security Group Rule Ingress
resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.default.id
}

##Security Group Rule Egress
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}