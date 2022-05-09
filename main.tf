provider "aws" {
  access_key = "AKIATXRYDVMLRWGRV7OT"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_instance" "KirilPetkovTestEndava" {
  ami           = "ami-09439f09c55136ecf"
  key_name = "Test2"
  instance_type = "t2.micro"
  security_groups= ["${aws_security_group.security_SSH.name}"]
  tags= {
    Name = "DemoKiril"
  }
}

resource "aws_security_group" "security_SSH" {
  name        = "security_SSH"
  description = "security group for SSH"


 ingress {
 
    from_port   = 22	
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_group_SSH"
  }
}

