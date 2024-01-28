## EKS Cluster Stuffs 
resource "aws_eks_cluster" "dev" {
    for_each = var.clusters

    name     = each.key
    role_arn = aws_iam_role.dev[each.value.role].arn

    enabled_cluster_log_types = ["api", "audit"]

    vpc_config {
        subnet_ids = each.value.subnet_ids
        endpoint_private_access = true
        endpoint_public_access  = true
        # Restrict the control plane to only my public ip (or work vpn?)
        public_access_cidrs     = each.value.public_access
    }

    access_config {
        # We really want API! 
        authentication_mode                         = "API_AND_CONFIG_MAP"
        bootstrap_cluster_creator_admin_permissions = true
    }

    depends_on = [aws_cloudwatch_log_group.default]
}
