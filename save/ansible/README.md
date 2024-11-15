# Comprehensive Ansible Guide

## Table of Contents

- [Overview](#overview)
- [Working with Cloud Providers](#working-with-cloud-providers)
- [Ansible Galaxy](#ansible-galaxy)
- [Best Practices](#best-practices)
- [GitHub Actions Integration](#github-actions-integration)

## Overview

Ansible is an open-source automation tool that enables infrastructure as code, configuration management, and application deployment. This guide covers how to use Ansible effectively with cloud providers and automate deployments.

## Working with Cloud Providers

### AWS

When working with AWS and Terraform provider, you can use the following command to get the instance info.
With Terraform local backend you could configure the output.tf file to get the instance info.
So the code to generate the investory file looks like this:

```hcl
locals {
  inventory = <<EOF
  [all]
  ${aws_instance.control.public_ip} ansible_host=${aws_instance.control.public_ip} ansible_user=ubuntu
  ${aws_instance.node1.public_ip} ansible_host=${aws_instance.node1.public_ip} ansible_user=ubuntu
  EOF
}

resource "local_file" "inventory" {
  filename = "inventory"
  content  = local.inventory
}
```

Some configuration is needed to be done in the EC2 instance to allow the Ansible to connect to it in the node.tf file:

```hcl
resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = file("${path.module}/../ansible/terraform.pub")
}

resource "aws_instance" "host" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.terraform.key_name

  tags = {
    Name = ""
  }
}
```

## Ansible Galaxy

To create a role, you can use the following command:

```bash
ansible-galaxy init roles/role-name
```

To install the ansible galaxy role, you can use the following command:

```bash
ansible-galaxy install -r requirements.yml
```
