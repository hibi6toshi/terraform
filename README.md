# terraform

## terraform プロバイダーとは
terraform プロバイダーとは特定のクラウドサービスのHTTP APIを呼び出すコンポーネント

`.tf`, `.tf.json` で終わるどのファイルにも定義できるが、ベストプラクティスは`providers.tf`, `require_providers.tf`という名前のファイルに定義する。

## Terraform での変数を理解する
`var.` という構文で変数を使用できる。 
一般的には`variables.tf`とい名前の別ファイルに宣言する。

Terraformのワークフローを完成させるためには、これらの変数が値を取得する必要があります。
Terraformが変数を取得する方お方は4つあります。

1. Terraformの環境変数に変数値を定義する方法。
`TF_VAR_` で始まり、宣言された変数名が続く環境変数の値を探してきてくれます。
```
$ export TF_VAR_rgname=example-rg
```
2. ファイルに定義する。
`terraform.tfvars` または `terraform.tfvars.json`というデフォルトでサポートされているファイルか、`.auto.tfvars`または`.auto.tfvars.json` で終わるファイル名に変数の値を格納できます。

```.tf: terraform.tfvars
rgname = "Terraform-rg"
rgloccation = "WQest Europe"
idle_timeout_in_minutes = 10
...
```

デフォルトでサポートされていないファイル名:`testing.tfvars`のようなファイルに入力変数を定義する場合は、Terraformコマンド実行時に 
```
terraform apply -var-fiile="testing.tfvars"
```
のように、ファイル名を明示的に指定する必要があります。

3. コマンド実行時に指定する方法
main.tf や variables.tf で変数を定義し、その入力値がない場合、実行時にそれぞれの変数値を提供するようプロンプトが表示されまs。
```
terraform plan
var.rglocation
Resource Group location like West Europe etc.
Enter a value:
```

4.  変数を宣言する際にデフォルト値(default)として変数値を直接定義することです。
```
variable "rgname" {
  description = "リソースグループの名称を指定します。"
  type = string
  default = "example-rg"
}
```

メモ:
  `variable.tf `は「こんな変数を使いたいです。」的な宣言を行う場所（デフォルト値も設定できる）。　`.tfvars` は「変数にはこの値を渡したいです。」的な変数に値を指定する場所。

## Terraform のデータソーズを理解する
Terraformにおけるdata sourceは、既存のリソースや外部の情報源からデータを読み取るための機能です。

AWSでのTerraformデータソースの例
既存のAWS VPCにサブネットを作成したい場合。
```
variable "vpc_id" {}

data "aws_vpc" "example" {
  id = var.vpc_id
}

resource "aws_subnet" "example" {
  vpc_id = data.aws_vpc.example.id
  availability_zone = "us-west-2a"
  cidr_block = cidrsubnet(data.aws_vpc.example.cider_block, 4, 1)
}
```