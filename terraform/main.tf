terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.0"
        }
    }
    backend "s3" {
        key  = "aws/ec2-deploy/terraform.tfstate"
    }
}

provider "aws" {
    region = var.region

}
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.maingroup.id]

  tags = {
    Name = "TerraformServer"
  }
}

resource "aws_iam_instance_profile" "ec2-profile" {
    name = "ec2-profile"
    role = "EC2-ECR-AUTH" # The IAM role "EC2-ECR-AUTH" must exist in AWS before applying this configuration
}
resource "aws_security_group" "maingroup" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            description= ""
            from_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "-1"
            security_groups = []
            self = false
            to_port = 0
        }   
    ]

    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = ""
            from_port = 22
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "tcp"
            security_groups = []
            self = false
            to_port = 22 #traffico ssh
        },
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = ""
            from_port = 80
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "tcp"
            security_groups = []
            self = false
            to_port = 80
        }
    ]
}

resource "aws_key_pair" "deployer"{
    key_name = var.key_name
    public_key = var.public_key
}

output "instance_public_ip" {
    value = aws_instance.server.public_ip
    sensitive = true
}