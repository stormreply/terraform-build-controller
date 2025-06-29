resource "aws_instance" "instance" {
  #ts:skip=AC-AW-IS-IN-M-0144 Do not deploy within Default VPC TODO:
  ami                         = local.ami
  ebs_optimized               = true
  iam_instance_profile        = aws_iam_instance_profile.instance.name
  instance_type               = var.instance_type
  monitoring                  = var.detailed_monitoring
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data
  user_data_replace_on_change = true
  vpc_security_group_ids      = var.vpc_security_group_ids
  # TODO: rather not use user_data_base64, check encryption options
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted   = true
    volume_size = var.root_volume_size
  }
  tags = {
    Name = local.instance_name
  }
}
