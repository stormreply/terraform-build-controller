resource "aws_instance" "controller" {
  ami                  = data.aws_ami.latest_al2023_hvm_ebs_x86_64.id
  iam_instance_profile = aws_iam_instance_profile.controller.name
  instance_type        = var.instance_type
  user_data            = var.user_data

  user_data_replace_on_change = true
  root_block_device { volume_size = var.root_volume_size }

  tags = {
    Name = "${var.deployment.name}-controller"
  }
}
