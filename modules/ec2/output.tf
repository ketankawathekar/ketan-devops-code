# public ip of my ec2 instance

output "my-ec2-pb-ip" {
  value = aws_instance.example[*].public_ip
}

# instance id of my ec2
output "my-ec2ID" {

  value = aws_instance.example[*].id

}
# storig data in local system
resource "local_file" "ketan-data" {
  content  = "[ketan-roche]\n${join("\n",aws_instance.example[*].public_ip)}"
  filename = "${path.module}/ansible-inventory.txt"
  #making manual dependecy 
  depends_on = [aws_instance.example]
}


