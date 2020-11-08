# terraform-aws-iam
Terraform module for managing AWS IAM

## Generic Example

In the following example we will create:

- 1 Role
- 1 Role Policy
- 1 Policy
- 1 User
- 1 User Policy
- 1 Group
- 1 Group Policy

In the next example we will attach a policy that either exists or will be created in a different step



    module "iam" {
        source = "github.com/ulfox/terraform-aws-iam.git?ref=v0.0.1"
        region = "eu-north-1"
        profile = "sres"

        role_name = [
            "someRole",
        ]

        role_description = [
            "someDescription",
        ]

        role_assume_role_policy = [
            {
                "Version" : "2012-10-17",
                "Statement" : [
                    {
                        "Effect" : "Allow",
                        "Principal" : {
                            "Service" : [
                                "ec2.amazonaws.com"
                            ]
                        },
                        "Action" : "sts:AssumeRole"
                    }
                ]
            },
        ]

        role_tags = [
            {
                "Name"        = "someNmae"
            }
        ]

        role_policy = [
            {
                "Version" : "2012-10-17",
                "Statement" : [
                {
                    "Action" : [
                    "sts:GetCallerIdentity"
                    ],
                    "Resource" : "*",
                    "Effect" : "Allow"
                }
                ]
            }
        ]

        profile_name = ["someProfileName"]

        policy = [
            {
                "Version" : "2012-10-17",
                "Statement" : [
                {
                    "Action" : [
                    "sts:GetCallerIdentity"
                    ],
                    "Resource" : "*",
                    "Effect" : "Allow"
                }
                ]
            },
        ]

        group_name = ["someGroupName"]

        group_policy = [
            {
            "Version" : "2012-10-17",
            "Statement" : [
                {
                "Action" : [
                    "sts:GetCallerIdentity"
                ],
                "Resource" : "*",
                "Effect" : "Allow"
                }
            ]
            },
        ]

        user_name = ["someUserA"]
        user_path = ["/"]

        user_policy_name = [
            "somePolicyName",
        ]

        user_policy = [
            {
            "Version" : "2012-10-17",
            "Statement" : [
                {
                "Action" : [
                    "sts:GetCallerIdentity"
                ],
                "Resource" : "*",
                "Effect" : "Allow"
                }
            ]
            },
        ]

        user_group_membership_groups = ["someGroupName"]
    }


## Policy Attachment

Attaching a new managed policy to a role

- 1 Role Policy Attachment

Note: The policy can also be created and attached to the role on creation (see first example)

    module "iam_policy_attachment" {
        source = "github.com/ulfox/terraform-aws-iam.git?ref=v0.0.1"
        region = "eu-north-1"
        profile = "sres"

        role_policy_attachment_name = [
            module.iam.policy_name[0]
        ]
        role_policy_attachment_role_arn = [
            module.iam.role_arn[0]
        ]
    }

## Requirements

| Name | Version |
|------|---------|
| aws | >= 2.28.1 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.28.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| group\_name | The group's name | `list(string)` | `[]` | no |
| group\_name\_prefix | Creates a unique name beginning with the specified prefix | `list(string)` | `[]` | no |
| group\_path | Path in which to create the group | `list(string)` | `[]` | no |
| group\_policy | The policy document | `any` | `null` | no |
| group\_policy\_attachment\_group\_arn | The ARN of the policy you want to apply | `list(string)` | `[]` | no |
| group\_policy\_attachment\_name | The group the policy should be applied to | `list(string)` | `[]` | no |
| group\_policy\_name | The name of the policy | `list(string)` | `[]` | no |
| policy | The policy document | `any` | `null` | no |
| policy\_description | Description of the IAM policy | `list(string)` | `[]` | no |
| policy\_enabled | Enable IAM Policy | `bool` | `false` | no |
| policy\_name | The name of the policy | `list(string)` | `[]` | no |
| policy\_name\_prefix | Creates a unique name beginning with the specified prefix | `list(string)` | `[]` | no |
| policy\_path | Path in which to create the policy | `list(string)` | `[]` | no |
| profile | the AWS profile | `string` | n/a | yes |
| profile\_name | The profile's name | `list(string)` | `[]` | no |
| profile\_name\_prefix | Creates a unique name beginning with the specified prefix | `list(string)` | `[]` | no |
| profile\_path | Path in which to create the profile | `list(string)` | `[]` | no |
| region | the AWS region in which resources are created | `string` | n/a | yes |
| role\_assume\_role\_policy | The policy that grants an entity permission to assume the role | `any` | `null` | no |
| role\_description | The description of the role | `list(string)` | `[]` | no |
| role\_enabled | Enable IAM Role | `bool` | `false` | no |
| role\_force\_detach\_policies | Specifies to force detaching any policies the role has before destroying it | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| role\_name | The name of the role | `list(string)` | `[]` | no |
| role\_name\_prefix | Creates a unique name beginning with the specified prefix | `list(string)` | `[]` | no |
| role\_path | The path to the role | `list(string)` | `[]` | no |
| role\_policy | The inline policy document. This is a JSON formatted string | `any` | `null` | no |
| role\_policy\_attachment\_name | The role the policy should be applied to | `list(string)` | `[]` | no |
| role\_policy\_attachment\_role\_arn | The ARN of the policy you want to apply | `list(string)` | `[]` | no |
| role\_policy\_name | The name of the role policy | `list(string)` | `[]` | no |
| role\_policy\_name\_prefix | reates a unique name beginning with the specified prefix. Conflicts with name. | `list(string)` | `[]` | no |
| role\_policy\_role\_name | The IAM role to attach to the policy | `list(string)` | `[]` | no |
| role\_tags | Key-value map of tags for the IAM role | `list(map(string))` | `null` | no |
| user\_force\_destroy | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices | `list(bool)` | `[]` | no |
| user\_name | The name of the user | `list(string)` | `[]` | no |
| user\_path | The path to the user | `list(string)` | `[]` | no |
| user\_permissions\_boundary | The ARN of the policy that is used to set the permissions boundary for the user | `list(string)` | `[]` | no |
| user\_policy | The policy document | `any` | `null` | no |
| user\_policy\_attachment\_arn | The ARN of the policy you want to apply | `list(string)` | `[]` | no |
| user\_policy\_attachment\_name | The user the policy should be applied to | `list(string)` | `[]` | no |
| user\_policy\_id | IAM user to which to attach this policy | `list(string)` | `[]` | no |
| user\_policy\_name | The policy name of the user | `list(string)` | `[]` | no |
| user\_policy\_name\_prefix | The policy name prefix of the user | `list(string)` | `[]` | no |
| user\_tags | Key-value map of tags for the IAM user | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_iam\_group\_policy\_arn | The ARN of the policy you want to apply |
| aws\_iam\_group\_policy\_attachment | The group the policy should be applied to |
| group\_arn | The group arn |
| group\_id | The group id |
| group\_name | The group name |
| group\_policy | The group to which the policy applies |
| group\_policy\_document | The policy document |
| group\_policy\_id | The group policy id |
| group\_policy\_name | The policy name |
| group\_unique\_id | The group unique id |
| policy\_arn | The policy arn |
| policy\_attachment\_id | The policy attachment id |
| policy\_attachment\_name | The policy attachment name |
| policy\_description | The policy description |
| policy\_document | The policy document |
| policy\_id | The policy id |
| policy\_name | The policy name |
| policy\_path | The policy path |
| profile\_arn | The profile arn |
| profile\_id | The profile id |
| profile\_name | The profile name |
| profile\_path | The profile path |
| profile\_role | The profile role |
| role\_arn | The role arn |
| role\_description | The role description |
| role\_id | The role id |
| role\_name | The role name |
| role\_policy\_document | The policy document |
| role\_policy\_id | The policy id |
| role\_policy\_name | The policy name |
| role\_policy\_role | The policy role |
| role\_unique\_id | The role unique id |
| user\_arn | The user's arn |
| user\_name | The user's name |
| user\_policy\_id | The user policy ID, in the form of user\_name:user\_policy\_name |
| user\_policy\_name | The name of the policy |
| user\_unique\_id | The user's unique id |

