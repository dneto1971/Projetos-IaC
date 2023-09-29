terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16" 
      # alterado para versao mais atual
    }
  }

  required_version = ">= 1.2.0"
  # alterado para versao mais atual
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29"
  # alterar ami de acordo com qual imagem do servidor. ex ubuntu server
  instance_type = "t2.micro"
  key_name = "iac-alura"
  # utilizar outra key_name
  #user_data = <<-EOF
  #              #!/bin/bash
  #               cd /home/ubuntu
  #               echo "<h1>Feito com Terraform</h1>" > index.html
  #               nohup busybox httpd -f -p 8080 &
  #               EOF
  tags = {
    Name = "Teste aws"
    # alterar para nome do projeto
  }
}