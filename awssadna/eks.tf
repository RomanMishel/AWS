module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"

    cluster_name = "my-eks"
    cluster_version = "1.25"

    cluster_endpoint_private_access = true
    cluster_endpoint_public_access  = true

    vpc_id     = "vpc-09cb72588a36df91d"
    subnet_ids = module.vpc.private_subnets

    enable_irsa = true

    eks_managed_node_group_defaults = {
        disk_size = 50
    }

    eks_managed_node_groups = {
        batch = {
            desired_size = 1
            min_size     = 1
            max_size     = 2

            labels = {
                role ="batch"
            }

            instance_type = ["t2.micro"]
            capacity_type = "ON_DEMAND"

            taints = [{
                key     = "gpu"
                value   = "false"
                effect  = "NO_SCHEDULE"
            }]
        }

        gpu = {
            desired_size = 1
            min_size     = 1
            max_size     = 2


            labels = {
                role = "gpu"
            }


            instance_type = ["t2.micro"]


            taints = [{
                key     = "gpu"
                value   = "false"
                effect  = "NO_SCHEDULE"
            }]


            instance_type = ["t3.micro"]
            capacity_type = "SPOT"
        }
        tags = {
            Environment = "dev"
        }
    }
}