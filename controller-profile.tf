resource "aws_iam_instance_profile" "controller" {
  name = "${var.deployment.name}-controller-profile"
  role = aws_iam_role.controller.name
}

resource "aws_iam_role" "controller" {
  name               = "${var.deployment.name}-controller"
  assume_role_policy = data.aws_iam_policy_document.client_assume_role.json
}

data "aws_iam_policy_document" "client_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "amazon_ssm_managed_instance_core" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "amazon_ssm_managed_instance_core" {
  role       = aws_iam_role.controller.name
  policy_arn = data.aws_iam_policy.amazon_ssm_managed_instance_core.arn
}

# TODO:
data "aws_iam_policy" "administrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# TODO:
resource "aws_iam_role_policy_attachment" "adminmistrator_access" {
  role       = aws_iam_role.controller.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}
