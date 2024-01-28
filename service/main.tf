## EKS Cluster Stuffs 
resource "aws_eks_cluster" "dev" {
    for_each = var.clusters

    name     = each.key
    role_arn = aws_iam_role.dev[each.value.role].arn

    version  = each.value.version
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

resource "aws_eks_node_group" "nodes" {
    for_each        = var.node_pools

    cluster_name    = aws_eks_cluster.dev[each.key].id
    node_group_name = each.key
    node_role_arn   = aws_iam_role.dev[each.value.role].arn
    subnet_ids      = each.value.subnet_ids

    scaling_config {
        desired_size = each.value.desired_size
        max_size     = each.value.max_size
        min_size     = each.value.min_size
    }

    update_config {
        max_unavailable = each.value.max_unavailable
    }
}

resource "aws_cloudwatch_log_group" "default" {
    for_each = var.clusters
    # The log group name format is /aws/eks/<cluster-name>/cluster
    # Reference: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
    name              = "/aws/eks/${each.key}/cluster"
    retention_in_days = each.value.retention
}
