
// ------------------------------------------------------------
// IAM Role Locals
// ------------------------------------------------------------
locals {
  can_role = (
    can(var.role_assume_role_policy[0]) == true
  ) ? true : false

  assume_policies = (
    local.can_role
  ) ? length(var.role_assume_role_policy) : 0
}

// ------------------------------------------------------------
// IAM Role Policies Locals
// ------------------------------------------------------------
locals {
  can_role_policy = (
    can(var.role_policy[0]) == true
  ) ? true : false

  role_policies_num = (
    local.can_role_policy
  ) ? length(var.role_policy) : 0
}

// ------------------------------------------------------------
// IAM Profile Locals
// ------------------------------------------------------------
locals {
  can_profile_policy = (
    can(var.profile_name[0]) == true
  ) ? true : false

  profile_num = (
    local.can_profile_policy
  ) ? length(var.profile_name) : 0
}

// ------------------------------------------------------------
// IAM Role Policy Attachment Locals
// ------------------------------------------------------------
locals {
  can_role_policy_attach = (
    length(var.role_policy_attachment_name) != 0 &&
    length(var.role_policy_attachment_role_arn) != 0 &&
    length(var.role_policy_attachment_name) == length(var.role_policy_attachment_role_arn)
  ) ? true : false

  can_role_policies_attach_num = (
    local.can_role_policy_attach
  ) ? length(var.role_policy_attachment_name) : 0
}

// ------------------------------------------------------------
// IAM Policy
// ------------------------------------------------------------
locals {
  can_policy = (
    can(var.policy[0]) == true
  ) ? true : false

  policies_num = (
    local.can_policy
  ) ? length(var.policy) : 0
}

// ------------------------------------------------------------
// IAM Group Locals
// ------------------------------------------------------------
locals {
  can_group = (
    can(var.group_name[0]) == true
  ) ? true : false

  groups_num = (
    local.can_group
  ) ? length(var.group_name) : 0
}

// ------------------------------------------------------------
// IAM Group Policy Locals
// ------------------------------------------------------------
locals {
  can_group_policy = (
    can(var.group_policy[0]) == true
  ) ? true : false

  groups_policies_num = (
    local.can_group_policy
  ) ? length(var.group_policy) : 0
}

// ------------------------------------------------------------
// IAM Group Policy Attachment Locals
// ------------------------------------------------------------
locals {
  can_group_policy_attach = (
    length(var.group_policy_attachment_name) != 0 &&
    length(var.group_policy_attachment_group_arn) != 0 &&
    length(var.group_policy_attachment_name) == length(var.group_policy_attachment_group_arn)
  ) ? true : false

  can_group_policies_attach_num = (
    local.can_group_policy_attach
  ) ? length(var.group_policy_attachment_name) : 0
}

// ------------------------------------------------------------
// IAM User Locals
// ------------------------------------------------------------
locals {
  can_user = (
    can(var.user_name[0]) == true
  ) ? true : false

  users_num = (
    local.can_user
  ) ? length(var.user_name) : 0
}


// ------------------------------------------------------------
// IAM User Policy Locals
// ------------------------------------------------------------
locals {
  can_user_policy = (
    can(var.user_policy[0]) == true
  ) ? true : false

  users_policy_num = (
    local.can_user_policy
  ) ? length(var.user_policy) : 0
}

// ------------------------------------------------------------
// IAM User Policy Attachment Locals
// ------------------------------------------------------------
locals {
  can_user_policy_attach = (
    length(var.user_policy_attachment_name) != 0 &&
    length(var.user_policy_attachment_arn) != 0 &&
    length(var.user_policy_attachment_name) == length(var.user_policy_attachment_arn)
  ) ? true : false

  users_policy_attach_num = (
    local.can_user_policy_attach
  ) ? length(var.user_policy_attachment_name) : 0
}

// ------------------------------------------------------------
// IAM User Group Membership Locals
// ------------------------------------------------------------
locals {
  can_user_external = (
    can(var.user_group_membership_user[0]) == true
  ) ? true : false

  can_user_group_member = (
    local.can_user_external
  ) ? (
    (
      can(var.user_group_membership_user[0]) &&
      can(var.user_group_membership_groups[0]) &&
      length(var.user_group_membership_user) == length(var.user_group_membership_groups)
    ) ? true : false
  ) : (
    (
      can(var.user_group_membership_groups[0])
    ) ? true : false
  )

  user_group_member_num = (
    local.can_user_group_member
  ) ? length(var.user_group_membership_groups) : 0
}
