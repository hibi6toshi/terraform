# リソースグループ用の変数

variable "rgname" {
  description = "リソースグループの名称を指定します（必須）"
  type = string
  default = "example-rg"
}

# リージョン用の変数
variable "rglocation" {
  description = "リソースグループの名称を指定する。"
  type = string
  default = "japaneast"
}

# ネットワーク用の変数
variable "public_ip_name" {
  description = "パブリックIPの名称を指定します"
  type = string
  default = "example-ip"
}

# # リソースグループの作成
# resource "azurerm_resource_group" "rg" {
#   name     = var.rgname
#   location = var.rglocation
# }

resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}