# The ID of the VPC
output "aws_vpc_id" {
  value = aws_vpc.demo.id
}

# The ID of the instance
output "demo_server1_id" {
  value = aws_instance.demo_server1.id
}

# The ID of the instance
output "demo_server2_id" {
  value = aws_instance.demo_server2.id
}

# The ID of the instances
output "prod_servers_id" {
  value = length(aws_instance.prod_servers) > 0 ? aws_instance.prod_servers.*.id : null
}