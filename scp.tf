data "aws_iam_policy_document" "scp_protect_aft_custom_fields_doc" {
  statement {
    sid    = "DenyAFTCustomFieldsModification"
    effect = "Deny"

    actions = [
      "ssm:DeleteParameter*",
      "ssm:PutParameter",
      "account:PutAlternateContact",
      "account:DeleteAlternateContact"
    ]

    resources = [
      "arn:aws:ssm:*:*:parameter/aft/account-request/custom-fields/*"
    ]

    condition {
      test     = "ArnNotLike"
      variable = "aws:PrincipalArn"

      values = [
        "arn:aws:iam::*:role/AWSControlTowerExecution",
        "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/*/AWSReservedSSO_AWSAdministratorAccess_*",
        "arn:aws:iam::*:role/stacksets-exec-*",
        "arn:aws:iam::*:role/AWSAFTService",
        "arn:aws:iam::*:role/AWSAFTExecution"
      ]
    }
  }
}

resource "aws_organizations_policy" "scp_protect_aft_custom_fields" {
  name    = "scp_protect_aft_custom_fields"
  content = data.aws_iam_policy_document.scp_protect_aft_custom_fields_doc.json

  tags = {
    Environment = "TheFactory"
    Region      = "eu-west-1"
    Version     = "1"
    Managedby   = "Terraform"
  }
}

resource "aws_organizations_policy_attachment" "root" {
  policy_id = aws_organizations_policy.scp_protect_aft_custom_fields.id
  target_id = data.aws_organizations_organization.organization.roots[0].id
}
