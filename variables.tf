// ------------------------------------------------------------
// IAM Role Variables
// ------------------------------------------------------------
variable "region" {
  type        = string
  description = "the AWS region in which resources are created"
}

variable "profile" {
  type        = string
  description = "the AWS profile"
}

variable "role_enabled" {
  type        = bool
  default     = false
  description = "Enable IAM Role"
}

variable "role_name" {
  type        = list(string)
  default     = []
  description = "The name of the role"
}

variable "role_name_prefix" {
  type        = list(string)
  default     = []
  description = "Creates a unique name beginning with the specified prefix"
}

variable "role_description" {
  type        = list(string)
  default     = []
  description = "The description of the role"
}

variable "role_path" {
  type        = list(string)
  default     = []
  description = "The path to the role"
}

variable "role_force_detach_policies" {
  type        = list(bool)
  default     = [false]
  description = "Specifies to force detaching any policies the role has before destroying it"
}

variable "role_assume_role_policy" {
  default     = null
  description = "The policy that grants an entity permission to assume the role"
}

variable "role_tags" {
  type        = list(map(string))
  default     = null
  description = "Key-value map of tags for the IAM role"
}

// ------------------------------------------------------------
// IAM Role Policy Variables
// ------------------------------------------------------------
variable "role_policy_name" {
  type        = list(string)
  default     = []
  description = "The name of the role policy"
}

variable "role_policy_name_prefix" {
  type        = list(string)
  default     = []
  description = "reates a unique name beginning with the specified prefix. Conflicts with name."
}

variable "role_policy" {
  default     = null
  description = "The inline policy document. This is a JSON formatted string"
}

variable "role_policy_role_name" {
  type        = list(string)
  default     = []
  description = "The IAM role to attach to the policy"
}

// ------------------------------------------------------------
// IAM Profile Variables
// ------------------------------------------------------------
variable "profile_name" {
  type        = list(string)
  default     = []
  description = "The profile's name"
}

variable "profile_name_prefix" {
  type        = list(string)
  default     = []
  description = "Creates a unique name beginning with the specified prefix"
}

variable "profile_path" {
  type        = list(string)
  default     = []
  description = "Path in which to create the profile"
}

// ------------------------------------------------------------
// IAM Role Policy Attachment Variables
// ------------------------------------------------------------
variable "role_policy_attachment_name" {
  type        = list(string)
  default     = []
  description = "The role the policy should be applied to"
}

variable "role_policy_attachment_role_arn" {
  type        = list(string)
  default     = []
  description = "The ARN of the policy you want to apply"
}

// ------------------------------------------------------------
// IAM Policy Variables
// ------------------------------------------------------------
variable "policy_enabled" {
  type        = bool
  default     = false
  description = "Enable IAM Policy"
}

variable "policy_name" {
  type        = list(string)
  default     = []
  description = "The name of the policy"
}

variable "policy_name_prefix" {
  type        = list(string)
  default     = []
  description = "Creates a unique name beginning with the specified prefix"
}

variable "policy_description" {
  type        = list(string)
  default     = []
  description = "Description of the IAM policy"
}

variable "policy_path" {
  type        = list(string)
  default     = []
  description = "Path in which to create the policy"
}

variable "policy" {
  default     = null
  description = "The policy document"
}

// ------------------------------------------------------------
// IAM Group Variables
// ------------------------------------------------------------
variable "group_name" {
  type        = list(string)
  default     = []
  description = "The group's name"
}

variable "group_path" {
  type        = list(string)
  default     = []
  description = "Path in which to create the group"
}

// ------------------------------------------------------------
// IAM Group Policy Variables
// ------------------------------------------------------------
variable "group_policy_name" {
  type        = list(string)
  default     = []
  description = "The name of the policy"
}

variable "group_name_prefix" {
  type        = list(string)
  default     = []
  description = "Creates a unique name beginning with the specified prefix"
}

variable "group_policy" {
  default     = null
  description = "The policy document"
}

// ------------------------------------------------------------
// IAM Group Policy Attachment Variables
// ------------------------------------------------------------
variable "group_policy_attachment_name" {
  type        = list(string)
  default     = []
  description = "The group the policy should be applied to"
}

variable "group_policy_attachment_group_arn" {
  type        = list(string)
  default     = []
  description = "The ARN of the policy you want to apply"
}


// ------------------------------------------------------------
// IAM User Variables
// ------------------------------------------------------------
variable "user_name" {
  type        = list(string)
  default     = []
  description = "The name of the user"
}

variable "user_path" {
  type        = list(string)
  default     = []
  description = "The path to the user"
}

variable "user_permissions_boundary" {
  type        = list(string)
  default     = []
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
}

variable "user_force_destroy" {
  type        = list(bool)
  default     = []
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices"
}

variable "user_tags" {
  type        = list(map(string))
  default     = []
  description = "Key-value map of tags for the IAM user"
}

// ------------------------------------------------------------
// IAM User Policy Variables
// ------------------------------------------------------------
variable "user_policy_name" {
  type        = list(string)
  default     = []
  description = "The policy name of the user"
}

variable "user_policy_name_prefix" {
  type        = list(string)
  default     = []
  description = "The policy name prefix of the user"
}

variable "user_policy_id" {
  type        = list(string)
  default     = []
  description = "IAM user to which to attach this policy"
}

variable "user_policy" {
  default     = null
  description = "The policy document"
}

// ------------------------------------------------------------
// IAM User Policy Attachment Variables
// ------------------------------------------------------------
variable "user_policy_attachment_name" {
  type        = list(string)
  default     = []
  description = "The user the policy should be applied to"
}

variable "user_policy_attachment_arn" {
  type        = list(string)
  default     = []
  description = "The ARN of the policy you want to apply"
}

// ------------------------------------------------------------
// IAM User Group Membership Variables
// ------------------------------------------------------------
variable "user_group_membership_user" {
  type        = list(string)
  default     = []
  description = "The name of the IAM User to add to groups"
}

variable "user_group_membership_groups" {
  type        = list(string)
  default     = []
  description = "A list of IAM Groups to add the user to"
}

