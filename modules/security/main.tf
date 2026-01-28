resource "aws_security_group" "main" {
  name        = "${var.security_group_name}-${var.environment}"
  description = "Security group for ${var.environment} environment"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.security_group_name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.ssh_cidr]
  security_group_id = aws_security_group.main.id
  description       = "SSH access"
}

resource "aws_security_group_rule" "http" {
  count             = var.http_enabled ? 1 : 0
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
  description       = "HTTP access"
}

resource "aws_security_group_rule" "https" {
  count             = var.https_enabled ? 1 : 0
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
  description       = "HTTPS access"
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
  description       = "Allow all outbound traffic"
}
