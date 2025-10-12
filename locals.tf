locals {
  ami           = var.ami != null ? var.ami : data.aws_ami.latest_amazon_linux_ami.id
  instance_name = var.instance_name == null ? var.deployment.name : var.instance_name
  region        = data.aws_region.current.region
}
