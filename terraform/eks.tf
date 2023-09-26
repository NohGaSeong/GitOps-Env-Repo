data "aws_iam_policy_document" "cluster_assume_role" {
    statement {
        effect = "Allow"
    

    principals {
        type          = "Service"
        identifiers   = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
    }
}

resource "aws_iam_role" "eks_cluster_role" {
    name               = "${var.namespace}-cluster-role"
    assume_role_policy = data.aws_iam_policy_document.cluster_assume_role.json

    tags = merge(
        {
            Name = "${var.namespace}-cluster-role"
        },
        local.additional_tags
    )
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
    role       = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam:aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_vpc_resourece_controller" {
    role       = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}