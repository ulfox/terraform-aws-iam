
// ------------------------------------------------------------
// IAM Role Outputs
// ------------------------------------------------------------
output "role_arn" {
  description = "The role arn"
  value       = aws_iam_role.this.*.arn
}

output "role_name" {
  description = "The role name"
  value       = aws_iam_role.this.*.name
}

output "role_id" {
  description = "The role id"
  value       = aws_iam_role.this.*.id
}

output "role_description" {
  description = "The role description"
  value       = aws_iam_role.this.*.description
}

output "role_unique_id" {
  description = "The role unique id"
  value       = aws_iam_role.this.*.unique_id
}



// ------------------------------------------------------------
// IAM Role Policy Outputs
// ------------------------------------------------------------
output "role_policy_id" {
  description = "The policy id"
  value       = aws_iam_role_policy.this.*.id
}

output "role_policy_name" {
  description = "The policy name"
  value       = aws_iam_role_policy.this.*.name
}

output "role_policy_document" {
  description = "The policy document"
  value       = aws_iam_role_policy.this.*.policy
}

output "role_policy_role" {
  description = "The policy role"
  value       = aws_iam_role_policy.this.*.role
}

// ------------------------------------------------------------
// IAM Profile Outputs
// ------------------------------------------------------------
output "profile_id" {
  description = "The profile id"
  value       = aws_iam_instance_profile.this.*.id
}

output "profile_name" {
  description = "The profile name"
  value       = aws_iam_instance_profile.this.*.name
}

output "profile_arn" {
  description = "The profile arn"
  value       = aws_iam_instance_profile.this.*.arn
}

output "profile_role" {
  description = "The profile role"
  value       = aws_iam_instance_profile.this.*.role
}

output "profile_path" {
  description = "The profile path"
  value       = aws_iam_instance_profile.this.*.path
}

// ------------------------------------------------------------
// IAM Policy Outputs
// ------------------------------------------------------------
output "policy_id" {
  description = "The policy id"
  value       = aws_iam_policy.this.*.id
}

output "policy_arn" {
  description = "The policy arn"
  value       = aws_iam_policy.this.*.arn
}

output "policy_description" {
  description = "The policy description"
  value       = aws_iam_policy.this.*.description
}

output "policy_name" {
  description = "The policy name"
  value       = aws_iam_policy.this.*.name
}

output "policy_path" {
  description = "The policy path"
  value       = aws_iam_policy.this.*.path
}

output "policy_document" {
  description = "The policy document"
  value       = aws_iam_policy.this.*.policy
}

// ------------------------------------------------------------
// IAM Group Output
// ------------------------------------------------------------
output "group_id" {
  description = "The group id"
  value       = aws_iam_group.this.*.id
}

output "group_arn" {
  description = "The group arn"
  value       = aws_iam_group.this.*.arn
}

output "group_name" {
  description = "The group name"
  value       = aws_iam_group.this.*.name
}

output "group_unique_id" {
  description = "The group unique id"
  value       = aws_iam_group.this.*.unique_id
}

// ------------------------------------------------------------
// IAM Group Policy
// ------------------------------------------------------------
output "group_policy_id" {
  description = "The group policy id"
  value       = aws_iam_group_policy.this.*.id
}

output "group_policy" {
  description = "The group to which the policy applies"
  value       = aws_iam_group_policy.this.*.id
}

output "group_policy_name" {
  description = "The policy name"
  value       = aws_iam_group_policy.this.*.name
}

output "group_policy_document" {
  description = "The policy document"
  value       = aws_iam_group_policy.this.*.policy
}

// ------------------------------------------------------------
// IAM Group Policy Attachment Outputs
// ------------------------------------------------------------
output "aws_iam_group_policy_attachment" {
  description = "The group the policy should be applied to"
  value       = aws_iam_group_policy.this.*.group
}

output "aws_iam_group_policy_arn" {
  description = "The ARN of the policy you want to apply"
  value       = aws_iam_group_policy.this.*.policy
}

// ------------------------------------------------------------
// IAM User Outputs
// ------------------------------------------------------------
output "user_name" {
  description = "The user's name"
  value       = aws_iam_user.this.*.name
}

output "user_arn" {
  description = "The user's arn"
  value       = aws_iam_user.this.*.arn
}

output "user_unique_id" {
  description = "The user's unique id"
  value       = aws_iam_user.this.*.unique_id
}

// ------------------------------------------------------------
// IAM User Policy Outputs
// ------------------------------------------------------------
output "user_policy_id" {
  description = "The user policy ID, in the form of user_name:user_policy_name"
  value       = aws_iam_user_policy.this.*.id
}

output "user_policy_name" {
  description = "The name of the policy"
  value       = aws_iam_user_policy.this.*.name
}

