
// ------------------------------------------------------------
// IAM Role
// ------------------------------------------------------------
resource "aws_iam_role" "this" {
  count              = local.can_role ? local.assume_policies : 0
  name               = length(var.role_name) - (count.index + 1) >= 0 ? var.role_name[count.index] : null
  description        = length(var.role_description) - (count.index + 1) >= 0 ? var.role_description[count.index] : null
  path               = length(var.role_path) - (count.index + 1) >= 0 ? var.role_path[count.index] : null
  assume_role_policy = jsonencode(var.role_assume_role_policy[count.index])

  tags = length(var.role_tags) - (count.index + 1) >= 0 ? var.role_tags[count.index] : null
}

// ------------------------------------------------------------
// IAM Role Policy
// ------------------------------------------------------------
resource "aws_iam_role_policy" "this" {
  count  = local.can_role && local.can_role_policy == true ? local.role_policies_num : 0
  name   = length(var.role_policy_name) - (count.index + 1) >= 0 ? var.role_policy_name[count.index] : null
  role   = aws_iam_role.this[count.index].id
  policy = jsonencode(var.role_policy[count.index])

  depends_on = [
    aws_iam_role.this,
  ]
}

// ------------------------------------------------------------
// IAM Profile
// ------------------------------------------------------------
resource "aws_iam_instance_profile" "this" {
  count       = local.can_role && local.can_profile_policy == true ? local.profile_num : 0
  name        = length(var.profile_name) - (count.index + 1) >= 0 ? var.profile_name[count.index] : null
  name_prefix = length(var.profile_name_prefix) - (count.index + 1) >= 0 ? var.profile_name_prefix[count.index] : null
  path        = length(var.profile_path) - (count.index + 1) >= 0 ? var.profile_path[count.index] : null
  role        = aws_iam_role.this[count.index].name
  depends_on = [
    aws_iam_role.this,
  ]
}


// ------------------------------------------------------------
// IAM Role Policy Attachment
// ------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "this" {
  count      = local.can_role_policy_attach ? local.can_role_policies_attach_num : 0
  role       = var.role_policy_attachment_name[count.index]
  policy_arn = var.role_policy_attachment_role_arn[count.index]
}
