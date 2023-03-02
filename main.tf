provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_lightsail_key_pair" "key_pair" {
  name   = "myKey"
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "local_key_pair" {
  filename = "myKey.pem"
  file_permission = "0400"
  content = tls_private_key.pk.private_key_pem
}

resource "aws_lightsail_instance" "lightsail_instance" {
  name          = "Utrains_devops"
  availability_zone = "us-east-1a"
  blueprint_id  = "centos_7_2009_01"
  bundle_id     = "nano_1_0"
  key_pair_name = aws_lightsail_key_pair.key_pair.name 
  tags = {
    foo = "utrains devops"
  }
}

## Creates a static public IP address on Lightsail
resource "aws_lightsail_static_ip" "static_ip" {
  name = "static_ip" ## Name of static IP in AWS
}

## Attaches static IP address to Lightsail instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
  static_ip_name = aws_lightsail_static_ip.static_ip.id
  instance_name  = aws_lightsail_instance.lightsail_instance.id
}