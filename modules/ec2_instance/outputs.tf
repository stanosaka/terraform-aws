output "aws_instance_arns" {
  # value       = aws_instance.ec2_cluster[*].arn
  value       = aws_instance.ec2_cluster.*.arn
  description = "List of ARNs for all created EC2 instances."
}

output "aws_instance_ids" {
  # value       = aws_instance.ec2_cluster[*].id
  value       = aws_instance.ec2_cluster.*.id
  description = "List of ids for all created EC2 instances."
}

output "aws_instance_private_ips" {
  # value       = aws_instance.ec2_cluster[*].private_ip
  value       = aws_instance.ec2_cluster.*.private_ip
  description = "List of private IPs for all created EC2 instances."
}
