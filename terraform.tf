provider "aws" {
  region     = "ap-south-1"

  
}

resource "aws_instance" "conf" {
  ami           = "ami-0f2ce9ce760bd7133"
  instance_type = "t2.micro"
  key_name      = "chandu"
  count         = "2"
  tags = {
    Name = "workers"
  }
  security_groups = [aws_security_group.conf_sg.name]
  user_data      = file("conf.sh")
}

resource "aws_security_group" "conf_sg" {
  tags = {
    Name = "flipkart_sg"
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
