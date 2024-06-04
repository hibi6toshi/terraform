# AWS Terraform プロバイダーの定義
terraform {
  required_version = ">= 1.7"
  required_providers {
    # ここでプロバイダーを定義
    aws =  {
      source = "hashicorp/aws"
      version = "~> 5.32.1"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}
# ここでプロバイダーの設定を行う
provider "aws" {
  region = "ap-northeast-1"
  access_key = "AWS_ACCESS"
  secret_key = "AWS_SECRET"
}
provider "azurerm" {
  features {}
  # alias でプロバイダーの別名を指定できる
  alias = "azurerm_01"
}
resource "aws_instance" "example" {
  # 特定のプロバイダーを指定（特定のプロバイダーに対してのみリソースを作成する）
  provider = aws
  ami = "ami-test"
  instance_type = "t2.micro"
}
resource "azurerm_resource_group" "example" {
  # プロバイダーの別名を指定
  provider = azurerm.azurerm_01
  name = "example-resources"
  location = "East US"
}