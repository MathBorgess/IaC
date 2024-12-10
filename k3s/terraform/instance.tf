
data "aws_ami" "amazon_linux_2" {
  # name        = "al2023-ami-kernel-6.1-x86_64"
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./my-keypair.pem"
  }
}

resource "aws_instance" "server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.small"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.terraform.key_name
  security_groups             = [aws_security_group.allow_ssh.name]

  tags = {
    Name = ""
  }
}

resource "aws_instance" "agent" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.small"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.terraform.key_name
  security_groups             = [aws_security_group.allow_ssh.name]

  tags = {
    Name = ""
  }
}
