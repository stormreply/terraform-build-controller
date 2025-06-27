locals {
  instance_name = var.instance_name == "" ? var.deployment.name : var.instance_name
}
