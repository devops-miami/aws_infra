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

## EKS Cluster Stuffs 
resource "aws_eks_cluster" "dev" {
    for_each = var.clusters
    
    name     = each.key
    role_arn = aws_iam_role.dev[each.value.role].arn

    vpc_config {
        subnet_ids = each.value.subnet_ids
        endpoint_private_access = true
        endpoint_public_access  = false
    }

    # Messing with this can get us the new setup mentioned in at Reinvent
    access_config {
        authentication_mode                         = "CONFIG_MAP"
        bootstrap_cluster_creator_admin_permissions = true
    }

}
