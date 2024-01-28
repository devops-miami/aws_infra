# IAM policy Stuffs
resource "aws_iam_role" "dev" {
    for_each = var.iam_roles

    name               = each.key
    assume_role_policy = file("${path.root}/policies/${each.value.policy_name}.json")
}

resource "aws_iam_role_policy_attachment" "dev" {
    for_each = var.policy_attachments

    policy_arn = each.value.policy_arn
    role       = aws_iam_role.dev[each.value.role].name
    # Note: remove vpc-resource-controller-policy from dev env file to disable
    # Optionally, enable Security Groups for Pods
    # Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
}
