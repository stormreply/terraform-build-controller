resource "aws_iam_instance_profile" "instance" {
  name = var.deployment.name
  role = aws_iam_role.instance.name
}

resource "aws_iam_role" "instance" {
  name               = "${var.deployment.name}-instance"
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
  role       = aws_iam_role.instance.name
  policy_arn = data.aws_iam_policy.amazon_ssm_managed_instance_core.arn
}

# TODO:
data "aws_iam_policy" "administrator_access" {
  # checkov:skip=CKV_AWS_274: "AWS AdministratorAccess policy is used by IAM roles, users, or groups"
  # checkov:skip=CKV_AWS_275: "Disallow policies from using the AWS AdministratorAccess policy"
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# TODO:
resource "aws_iam_role_policy_attachment" "administrator_access" {
  # checkov:skip=CKV_AWS_274: "Disallow IAM roles, users, and groups from using the AWS AdministratorAccess policy"
  role       = aws_iam_role.instance.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}

resource "aws_iam_role_policy_attachment" "additional_policies" {
  for_each = toset(var.policies)

  role       = aws_iam_role.instance.name
  policy_arn = each.value
}
