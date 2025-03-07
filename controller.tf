resource "aws_instance" "controller" {
  ami                  = data.aws_ami.latest_al2023_hvm_ebs_x86_64.id
  iam_instance_profile = aws_iam_instance_profile.controller.name
  instance_type        = "t3.medium"
  root_block_device { volume_size = 20 }
  user_data = data.cloudinit_config.controller.rendered

  user_data_replace_on_change = true
  tags = {
    Name = "${var.deployment.name}-controller"
  }
  # depends_on = [
  #   aws_db_instance.mysql,
  #   aws_secretsmanager_secret_version.master_password
  # ]
}
