resource "aws_key_pair" "terra_infra_key" {
  key_name = "${var.env}-infra-app-ley"
  public_key = file("terra-infra-app.pub")

  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Defualt vpc"
  }
}

resource "aws_security_group" "infra_app_security_group" {
    name = "${var.env}-infra-app-security-group"
    description = "This security group created using TF"
    vpc_id = aws_default_vpc.default_vpc.id
    
    ingress {
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }

    ingress {
        to_port = 80
        from_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }

    ingress {
        to_port = 443
        from_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTPS open"
    }

    egress {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "open for all"
    }

    tags = {
      Name = "${var.env}-infra-app-sg"
      
    }
  
}

resource "aws_instance" "infra_app_instance" {
  count = var.instance_count
  key_name = aws_key_pair.terra_infra_key.key_name
  security_groups = [aws_security_group.infra_app_security_group.name]
  instance_type = var.instance_type
  ami = var.ami_id

  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10 
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment = var.env
  }

}