# Create IAM Group for administrators
resource "aws_iam_group" "terces_admin" {
  name = "terces_admin"  # EDIT: Change the group name if needed
}

# Attach policies to terces_admin group
resource "aws_iam_group_policy_attachment" "terces_admin_ec2_full_access" {
  group      = aws_iam_group.terces_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "terces_admin_vpc_full_access" {
  group      = aws_iam_group.terces_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_group_policy_attachment" "terces_admin_cloud9_admin" {
  group      = aws_iam_group.terces_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9Administrator"
}

resource "aws_iam_group_policy_attachment" "terces_admin_iam_full_access" {
  group      = aws_iam_group.terces_admin.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

# Create IAM user and assign to terces_admin group
resource "aws_iam_user" "terraform_user" {
  name = "terraform"  # EDIT: Change the user name if needed

  tags = {
    Department = "Engineering"
  }
}

resource "aws_iam_user_group_membership" "terraform_user_group_membership" {
  user   = aws_iam_user.terraform_user.name
  groups = [aws_iam_group.terces_admin.name]
}

# Create IAM Group for developers
resource "aws_iam_group" "developers" {
  name = "developers"  # EDIT: Change the group name if needed
}

# Attach Cloud9 access policy to developers group
resource "aws_iam_group_policy_attachment" "developers_cloud9_access" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9EnvironmentMember"
}

# Create developer users and assign to developers group
resource "aws_iam_user" "developer_user1" {
  name = "developer1"  # EDIT: Change the user name if needed

  tags = {
    Department = "Engineering"
  }
}

resource "aws_iam_user_group_membership" "developer_user1_group_membership" {
  user   = aws_iam_user.developer_user1.name
  groups = [aws_iam_group.developers.name]
}

resource "aws_iam_user" "developer_user2" {
  name = "developer2"  # EDIT: Change the user name if needed

  tags = {
    Department = "Engineering"
  }
}

resource "aws_iam_user_group_membership" "developer_user2_group_membership" {
  user   = aws_iam_user.developer_user2.name
  groups = [aws_iam_group.developers.name]
}

resource "aws_iam_user" "developer_user3" {
  name = "developer3"  # EDIT: Change the user name if needed

  tags = {
    Department = "Engineering"
  }
}

resource "aws_iam_user_group_membership" "developer_user3_group_membership" {
  user   = aws_iam_user.developer_user3.name
  groups = [aws_iam_group.developers.name]
}
