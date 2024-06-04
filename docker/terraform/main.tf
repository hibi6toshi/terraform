# リソースタイプ: aws_instance
# ローカル名/リソース名: web
resource "aws_instance" "web" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}