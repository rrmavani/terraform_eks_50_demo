# Terraform Output Values

# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm[*].public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = ["${aws_instance.myec2vm[*].tags_all.Name}", "${aws_instance.myec2vm[*].public_ip}", "${aws_instance.myec2vm.*.public_dns}"]
}

output "Instance_info" {
  description = "information"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}
