# creating Ec2

resource "aws_instance" "example" {
    ami = "ami-0a25a306450a2cba3"
    instance_type = "t2.nano"
    key_name = "roche-key"
    tags_all = {
      "Name" = "ketan-vm" 
    }

}