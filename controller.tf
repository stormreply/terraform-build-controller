resource "aws_instance" "controller" {
  #ts:skip=AC-AW-IS-IN-M-0144 Do not deploy within Default VPC TODO:
  ami                         = data.aws_ami.latest_al2023_hvm_ebs_x86_64.id
  ebs_optimized               = true
  iam_instance_profile        = aws_iam_instance_profile.controller.name
  instance_type               = var.instance_type
  monitoring                  = var.detailed_monitoring
  user_data                   = var.user_data
  user_data_replace_on_change = true

  # TODO: rather not use user_data_base64, check encryption options
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted   = true
    volume_size = var.root_volume_size
  }

  tags = {
    Name = "${var.deployment.name}-controller"
  }
}
