data "aws_vpc" "default" {
  default = true
}


data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "test_instance" {
  source      = "../"
  subnet_id   = data.aws_subnets.default.ids[0]
  count       = 5
  name_prefix = "test-instance"
}

output "aws_instance_arns" {
  # value = [for instance in module.test_instance : instance.aws_instance_arns]
  value = module.test_instance[*].aws_instance_arns
}

output "aws_instance_ips" {
  value = module.test_instance[*].aws_instance_ips
}
