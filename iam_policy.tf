// ------------------------------------------------------------
// IAM Policy
// ------------------------------------------------------------
resource "aws_iam_policy" "this" {
  count       = local.can_role_policy && local.policies_num > 0 ? local.policies_num : 0
  name        = length(var.policy_name) - (count.index + 1) >= 0 ? var.policy_name[count.index] : null
  name_prefix = length(var.policy_name_prefix) - (count.index + 1) >= 0 ? var.policy_name_prefix[count.index] : null
  description = length(var.policy_description) - (count.index + 1) >= 0 ? var.policy_description[count.index] : null
  path        = length(var.policy_path) - (count.index + 1) >= 0 ? var.policy_path[count.index] : null
  policy      = jsonencode(var.policy[count.index])
}

