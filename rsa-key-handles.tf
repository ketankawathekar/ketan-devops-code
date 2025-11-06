# creating rsa based 4096 bits key pair
resource "tls_private_key" "example" {
  algorithm = var.private-key-algo
  rsa_bits  = var.key-size

}

#save my private key
resource "local_file" "private-key-data" {
  content = tls_private_key.example.private_key_pem
  #path.modules mean wher we are writing terraform tf files
  filename        = "${path.module}/ketan-key.pem"
  file_permission = 0400
}

#send pub key to aws cloud account

resource "aws_key_pair" "example" {
  key_name   = var.ec2-key-name
  public_key = tls_private_key.example.public_key_openssh
}

