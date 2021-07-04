resource "aws_iam_instance_profile" "admzjl2_iam_instance_profile" {
  name = "admzjl2_iam_instance_profile"
  role = "${aws_iam_role.admzjl2_iam_role.name}"
}
#test_role is the trust policy that allows ec2.amazonaws.com to assume the role policy defined in test_policy
resource "aws_iam_role" "admzjl2_iam_role" {
  name = "admzjl2_iam_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "TrustPolicyStatementThatAllowsEC2ServiceToAssumeTheAttachedRole"
    }
  ]
}
EOF
}
#test_policy is the IAM policy attached to the ec2.amazonaws.com Service role (TrustPolicy) dictating what action can be done from this AssumedRole
resource "aws_iam_role_policy" "admzjl2_iam_role_policy" {
  name = "admzjl2_iam_role_policy"
  role = "${aws_iam_role.admzjl2_iam_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}


locals {
  bucket_name = "s3-bucket-admzjl2"
}
resource "aws_s3_bucket" "admzjl2_bucket" {
  bucket = local.bucket_name
  acl    = "private"
  tags = {
            cost-centre = var.cost-centre
            created-by = var.created-by
            name = var.name
            schedule = var.schedule
            environment = var.environment
            business-owner = var.business-owner
            operational-owner = var.operational-owner
            operational-hours = var.operational-hours
            gitlab-project-id     = var.gitlab-project-id
            security-classification = var.security-classification
  }
}
