output "aws_instance_arns" {
  # value       = [for instance in aws_instance.hello_world : instance.arn]
  value       = aws_instance.hello_world[*].arn
  description = "List of ARNs for all created EC2 instances."
}

output "aws_instance_ips" {
  # value       = [for instance in aws_instance.hello_world : instance.private_ip]
  value       = aws_instance.hello_world[*].private_ip
  description = "List of private IPs for all created EC2 instances."
}

# output "aws_instances" {
#   value       = aws_instance.hello_world
#   description = "List of all created EC2 instances."
# }
