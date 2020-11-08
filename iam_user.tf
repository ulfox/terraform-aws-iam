// ------------------------------------------------------------
// IAM User
// ------------------------------------------------------------
resource "aws_iam_user" "this" {
  count                = local.can_user ? local.users_num : 0
  name                 = length(var.user_name) - (count.index + 1) >= 0 ? var.user_name[count.index] : null
  path                 = length(var.user_path) - (count.index + 1) >= 0 ? var.user_path[count.index] : null
  permissions_boundary = length(var.user_permissions_boundary) - (count.index + 1) >= 0 ? var.user_permissions_boundary[count.index] : null
  force_destroy        = length(var.user_force_destroy) - (count.index + 1) >= 0 ? var.user_force_destroy[count.index] : null

  tags = length(var.user_tags) - (count.index + 1) >= 0 ? var.user_tags[count.index] : null
}

// ------------------------------------------------------------
// IAM User Policy
// ------------------------------------------------------------
resource "aws_iam_user_policy" "this" {
  count       = local.can_user && local.can_user_policy ? local.users_policy_num : 0
  name        = length(var.user_policy_name) - (count.index + 1) >= 0 ? var.user_policy_name[count.index] : null
  name_prefix = length(var.user_policy_name_prefix) - (count.index + 1) >= 0 ? var.user_policy_name_prefix[count.index] : null
  policy      = jsonencode(var.user_policy[count.index])
  user        = aws_iam_user.this[count.index].name

  depends_on = [
    aws_iam_user.this,
  ]
}

// ------------------------------------------------------------
// IAM User Group Membership
// ------------------------------------------------------------
resource "aws_iam_user_group_membership" "this" {
  count                = local.can_user_group_member ? local.user_group_member_num : 0
  user                 =  (
    local.can_user_external
  ) ? (
    var.user_group_membership_user[count.index]
  ) : (
    aws_iam_user.this[count.index].name
  )
  groups               = [var.user_group_membership_groups[count.index]]
}

// ------------------------------------------------------------
// IAM User Policy Attachment
// ------------------------------------------------------------
resource "aws_iam_user_policy_attachment" "this" {
  count      = local.can_user_policy_attach ? local.users_policy_attach_num : 0
  user       = var.user_policy_attachment_name[count.index]
  policy_arn = var.user_policy_attachment_arn[count.index]
}


