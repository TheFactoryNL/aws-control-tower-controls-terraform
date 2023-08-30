# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# AWS Control Tower Controls (sometimes called Guardrails) Example Configuration

controls = [
  {
    control_names = [
      "AWS-GR_AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED",
      "AWS-GR_DMS_REPLICATION_NOT_PUBLIC",
      "AWS-GR_ENCRYPTED_VOLUMES",
      "AWS-GR_EBS_OPTIMIZED_INSTANCE",
      "AWS-GR_EBS_SNAPSHOT_PUBLIC_RESTORABLE_CHECK",
      "AWS-GR_EC2_VOLUME_INUSE_CHECK",
      "AWS-GR_LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED",
      "AWS-GR_RDS_INSTANCE_PUBLIC_ACCESS_CHECK",
      "AWS-GR_RDS_SNAPSHOTS_PUBLIC_PROHIBITED",
      "AWS-GR_RDS_STORAGE_ENCRYPTED",
      "AWS-GR_RESTRICTED_COMMON_PORTS",
      "AWS-GR_RESTRICTED_SSH",
      "AWS-GR_RESTRICT_ROOT_USER",
      "AWS-GR_RESTRICT_ROOT_USER_ACCESS_KEYS",
      #"AWS-GR_ROOT_ACCOUNT_MFA_ENABLED",
      "AWS-GR_S3_BUCKET_PUBLIC_READ_PROHIBITED",
      "AWS-GR_S3_BUCKET_PUBLIC_WRITE_PROHIBITED",
      "AWS-GR_SSM_DOCUMENT_NOT_PUBLIC",
      "AWS-GR_SUBNET_AUTO_ASSIGN_PUBLIC_IP_DISABLED",
      "XLSIRLRDKWVQ", # [CT.CLOUDFORMATION.PR.1] Disallow management of resource types, modules, and hooks within the AWS CloudFormation registry
    ],
    organizational_unit_ids = ["ou-8b3q-30a92cci", "ou-8b3q-7cuzgtwb", "ou-8b3q-n9c418kr"],
  },
  {
    # The following API controlidentifiers are region specific (eu-west-1)
    control_names = [
      "GNLTWRBKGZMV", # [CT.EC2.PR.5] Require any Amazon EC2 network ACL to prevent ingress from 0.0.0.0/0 to port 22 or port 3389
      "TPTBSUKLVYNV", # [SH.EC2.2] VPC default security group should not allow inbound and outbound traffic
      "YMSHAPVGFZMR", # [SH.EC2.21] Network ACLs should not allow ingress from 0.0.0.0/0 to port 22 or port 3389
      "ILUNFEJNBVLU", # [SH.EC2.7] EBS default encryption should be enabled
      "HBTSVIZWIAQY", # [SH.RDS.3] RDS DB instances should have encryption at-rest enabled
      "NRXPLVWHAEYX", # [SH.EC2.19] Security groups should not allow unrestricted access to ports with high risk
      "UBCGKOORFCMO", # [SH.EC2.1] EBS snapshots should not be publicly restorable
      "DUWNOGUJJEYE", # [SH.S3.3] S3 buckets should prohibit public write access
      "TUJJHFEUQRTD", # [SH.Account.1] Security contact information should be provided for an AWS account
      "OVZGSDCWZLCD", # [CT.IAM.PR.1] Require that an AWS Identity and Access Management (IAM) inline policy does not have a statement that includes "*" in the Action and Resource elements
      "ARQSBKHBXQCM", # [CT.IAM.PR.2] Require that AWS Identity and Access Management (IAM) customer-managed policies do not contain a statement that includes "*" in the Action and Resource elements
      "HTVEKDWTRMZF", # [CT.IAM.PR.4] Require that an AWS Identity and Access Management (IAM) user does not have an inline or managed policy attached attached
      "JGYSATNSTORL", # [SH.IAM.2] IAM users should not have IAM policies attached
      "RHVPZJVBRVIC", # [SH.IAM.3] IAM users' access keys should be rotated every 90 days or less
      "NEALLBIMAHJU", # [SH.IAM.4] IAM root user access key should not exist
      "WUGDSPITURNA", # [SH.IAM.5] MFA should be enabled for all IAM users that have a console password
      "VHIEQHFPSHXY", # [CT.KMS.PR.1] Require any AWS KMS key to have rotation configured
    ],
    organizational_unit_ids = ["ou-8b3q-30a92cci", "ou-8b3q-7cuzgtwb", "ou-8b3q-n9c418kr"],
  },
]
