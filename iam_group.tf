// ------------------------------------------------------------
// IAM Group
// ------------------------------------------------------------
resource "aws_iam_group" "this" {
  count = local.can_group ? local.groups_num : 0
  name  = length(var.group_name) - (count.index + 1) >= 0 ? var.group_name[count.index] : null
  path  = length(var.group_path) - (count.index + 1) >= 0 ? var.group_path[count.index] : null
}

// ------------------------------------------------------------
// IAM Group Policy
// ------------------------------------------------------------
resource "aws_iam_group_policy" "this" {
  count       = local.can_group && local.can_group_policy ? local.groups_policies_num : 0
  name        = length(var.group_policy_name) - (count.index + 1) >= 0 ? var.group_policy_name[count.index] : null
  name_prefix = length(var.group_name_prefix) - (count.index + 1) >= 0 ? var.group_name_prefix[count.index] : null
  policy      = jsonencode(var.group_policy[count.index])
  group       = aws_iam_group.this[count.index].name

  depends_on = [
    aws_iam_group.this,
  ]
}

// ------------------------------------------------------------
// IAM Group Policy Attachment
// ------------------------------------------------------------
resource "aws_iam_group_policy_attachment" "this" {
  count      = local.can_group_policy_attach ? local.can_group_policies_attach_num : 0
  group      = var.group_policy_attachment_name[count.index]
  policy_arn = var.group_policy_attachment_group_arn[count.index]
}
