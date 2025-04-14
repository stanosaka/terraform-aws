data "aws_vpc" "default" {
  default = true
}


data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "test_instances" {
  source         = "../"
  subnet_id      = data.aws_subnets.default.ids[0]
  instance_count = 3
  # count = 3 wrong!!
  name_prefix = "test-instance"
  enable_systems_manager = true
  tags = {
    "BillingGroup" = "szhougroup"
  }
}

output "aws_instance_arns" {
  value = module.test_instances.aws_instance_arns
}

output "aws_instance_ids" {
  value = module.test_instances.aws_instance_ids
}

output "aws_instance_ips" {
  value = module.test_instances.aws_instance_private_ips
}
